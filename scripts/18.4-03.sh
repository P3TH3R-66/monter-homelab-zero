#!/bin/sh
# secrets.sh : chiffrer ou deployer le .env d'une app
# Usage : sh secrets.sh chiffrer | deployer
# A lancer dans le dossier de l'app. Une panne donne
# un code non nul et laisse les anciens fichiers.
set -eu
umask 077
# Variables que l'app exige (ici Pocket ID, 18.2)
REQUISES="APP_URL ENCRYPTION_KEY"

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
  for v in $REQUISES; do
    grep -Eq "^$v=.+" "$t" || erreur "$v absente ou vide"
  done
  mv -fT -- "$t" .env ||
    erreur "remplacement refuse, .env inchange"
  chmod 600 .env
  sudo docker compose up -d || erreur "Compose a echoue"
  echo "OK : .env a jour (600), app demarree" ;;
*) erreur "choisis chiffrer ou deployer" ;;
esac
