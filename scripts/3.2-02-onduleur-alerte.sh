#!/bin/sh
# /usr/local/sbin/onduleur-alerte.sh (755, lisible par tous) :
# le sujet n'y est pas, il est lu dans son fichier
SUJET=$(cat /etc/nut/ntfy-sujet) || exit 1
curl -fsS -m 10 -H "Title: Onduleur : $NOTIFYTYPE" -d "$1" \
  "https://ntfy.sh/$SUJET" >/dev/null
