ls -la                         # avec les droits et les proprietaires
# qui prend de la place dans ce dossier
du -sh * | sort -h
# fichiers changes depuis 24 h
find /volume1/documents -type f -mtime -1
grep -ri "erreur" /var/log/nom.log
tail -f /var/log/nom.log
sha256sum fichier
# droits en chiffres (ex. 600), proprietaire, groupe
stat -c '%a %U %G' fichier
# lecture et ecriture pour son proprietaire seulement
chmod 600 .env
smartctl -H -A /dev/sda        # sante d'un disque dur (root)
# idem, sans reveiller un disque en veille
smartctl -n standby -H /dev/sda
cat /proc/mdstat               # etat du RAID
btrfs device stats /volume1    # erreurs Btrfs (0 partout = bon)
