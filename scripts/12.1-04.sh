#!/bin/sh
D=/volume2/docker/surveillance/textfile
etat=3
# exemple : la copie hors site ecrit, a la fin,
# l'identifiant de son instantane dans ce fichier
OK=/volume2/journaux/hors-site.ok
# un vrai fichier, non vide, de moins de 26 h
[ -n "$(find "$OK" -maxdepth 0 -type f -size +0 \
  -mmin -1560 2>/dev/null)" ] && etat=0
{
  printf 'homelab_sauvegarde_etat{nom="%s"} %s\n' \
    "Copie hors site" "$etat"
  printf 'homelab_maj_timestamp_seconds %s\n' "$(date +%s)"
} > "$D/sauvegardes.prom.tmp"
mv "$D/sauvegardes.prom.tmp" "$D/sauvegardes.prom"
