#!/bin/sh
# envoyer.sh SUJET TITRE < message
# Le jeton est lu dans son fichier (curl -H @fichier) :
# il n'apparait jamais dans la liste des processus.
E=/root/ntfy-entete
curl -fsS -m 15 -o /dev/null -H @"$E" -H "Title: $2" \
  --data-binary @- "http://127.0.0.1:2586/$1"
# Essai : echo Ok | sudo sh envoyer.sh homelab-critique Essai
