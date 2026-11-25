#!/usr/bin/env bash
# 7.11-02.sh : cle et secret Last.fm dans lastfm.env (a part)
# Usage : bash 7.11-02.sh /volume2/docker/navidrome
set -eu
umask 077
D="${1:-.}"
[ -f "$D/docker-compose.yml" ] || { echo "compose introuvable dans $D"; exit 1; }
[ -t 0 ] || { echo "Lance-le dans un terminal."; exit 1; }
printf 'Cle API Last.fm (saisie masquee) : '; read -rs K; echo
printf 'Secret partage (saisie masquee) : '; read -rs S; echo
# 32 caracteres hexadecimaux chez Last.fm : verifie sur ta page
for V in "$K" "$S"; do
  case "$V" in *[!0-9a-f]*) echo "Format inattendu, rien n'a ete ecrit."; exit 1;; esac
  [ "${#V}" -eq 32 ] || { echo "Longueur inattendue, rien n'a ete ecrit."; exit 1; }
done
T=$(mktemp "$D/.lastfm.env.XXXXXX")
trap 'rm -f "$T"' EXIT
printf 'ND_LASTFM_APIKEY=%s\nND_LASTFM_SECRET=%s\n' "$K" "$S" > "$T"
[ -s "$T" ] || { echo "Fichier vide, arret."; exit 1; }
chmod 600 "$T"
mv "$T" "$D/lastfm.env"
trap - EXIT
echo "lastfm.env ecrit (600) dans $D ; .env intact"
