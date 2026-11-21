#!/bin/sh
D=/volume2/docker/surveillance/textfile
etat=3
# exemple : la copie hors site a laisse un
# fichier OK de moins de 26 h
OK=/volume2/journaux/hors-site.ok
[ -n "$(find "$OK" -mmin -1560 2>/dev/null)" ] && etat=0
{
  printf 'homelab_sauvegarde_etat{nom="%s"} %s\n' \
    "Copie hors site" "$etat"
  printf 'homelab_maj_timestamp_seconds %s\n' "$(date +%s)"
} > "$D/sauvegardes.prom.tmp"
mv "$D/sauvegardes.prom.tmp" "$D/sauvegardes.prom"
