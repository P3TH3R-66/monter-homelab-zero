#!/bin/sh
# secrets.sh : chiffrer ou deployer le .env d'une app
# Usage : sh secrets.sh chiffrer | deployer
# A lancer dans le dossier de l'app. Une panne donne
# un code non nul ; si Compose echoue au deploiement,
# l'ancien .env (garde dans .env.precedent) revient.
set -eu
umask 077
# Variables exigees et longueur minimale (Pocket ID,
# 18.2 : cle de chiffrement d'au moins 16 octets)
REQUISES="APP_URL:1 ENCRYPTION_KEY:16"

d=$(mktemp -d ./.sops-travail.XXXXXXXX)
# Le clair ne survit ni a une panne ni a un Ctrl+C
trap 'rm -rf -- "$d"' 0
trap 'exit 1' HUP INT TERM
t=$d/resultat
erreur() { echo "ECHEC : $1" >&2; exit 1; }

case "${1:-}" in
chiffrer)
  : "${AGE_PUBLIC_KEY:?cle publique age requise}"
  sops encrypt --age "$AGE_PUBLIC_KEY" \
    --input-type dotenv --output-type dotenv \
    .env > "$t" || erreur "sops a echoue"
  test -s "$t" || erreur "sortie chiffree vide"
  mv -fT -- "$t" secrets.enc.env ||
    erreur "remplacement refuse, ancienne copie gardee"
  echo "OK : secrets.enc.env a jour" ;;
deployer)
  sops decrypt --input-type dotenv --output-type dotenv \
    secrets.enc.env > "$t" || erreur "sops a echoue"
  # valeur non vide, entre guillemets ou non ("" refuse)
  q="[^[:space:]#\"']|\"[^\"[:space:]][^\"]*\""
  q="$q|'[^'[:space:]][^']*'"
  for r in $REQUISES; do
    v=${r%%:*}
    grep -Eq "^$v=($q)" "$t" ||
      erreur "$v absente ou vide"
    # une seule fois : Compose garderait la derniere
    [ "$(grep -c "^$v=" "$t")" -eq 1 ] ||
      erreur "$v declaree plus d'une fois"
  done
  # la derniere configuration qui marchait (en 600)
  rm -f -- .env.precedent
  if [ -f .env ]; then
    cp -- .env .env.precedent
    chmod 600 .env.precedent
  fi
  mv -fT -- "$t" .env ||
    erreur "remplacement refuse, .env inchange"
  chmod 600 .env
  # Valeur vue par Compose, apres les ${...} : un nom de
  # variable absent donne une valeur vide. Jamais affichee.
  for r in $REQUISES; do
    v=${r%%:*}; m=${r#*:}
    l=$(sudo docker compose config 2>/dev/null | awk -v v="$v" \
      '$1 == v ":" { s = $0; sub(/^[^:]*: */, "", s)
        gsub(/^"|"$/, "", s); print length(s); exit }')
    if [ "${l:-0}" -lt "$m" ]; then
      if [ -f .env.precedent ]; then
        mv -fT -- .env.precedent .env
      else
        rm -f -- .env
      fi
      erreur "$v vide ou trop courte une fois resolue (rien demarre)"
    fi
  done
  # --wait : attend que l'app soit en bonne sante
  if ! sudo docker compose up -d --wait; then
    if [ ! -f .env.precedent ]; then
      # 1er deploiement : pas de secret en clair laisse
      rm -f -- .env
      erreur "Compose a echoue, .env retire (copie chiffree intacte)"
    fi
    mv -fT -- .env.precedent .env
    chmod 600 .env
    sudo docker compose up -d --wait ||
      echo "Attention : l'ancien .env ne demarre pas" >&2
    erreur "Compose a echoue : ancien .env remis"
  fi
  echo "OK : .env a jour (600), app en bonne sante" ;;
*) erreur "choisis chiffrer ou deployer" ;;
esac
