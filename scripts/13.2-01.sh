# Proxmox : sauvegarde de toutes les VM vers
# un stockage du NAS (exemple)
vzdump --all --storage nas-proxmox --mode snapshot --compress zstd \
       --prune-backups keep-daily=7,keep-weekly=4,keep-monthly=3

# Restaurer pour essayer, sous un numero LIBRE, sans demarrer
# doit repondre que la VM 900 n'existe pas ;
# sinon, prends un autre numero
qm status 900
# copie le nom exact du fichier (date ET heure)
ls /mnt/pve/nas-proxmox/dump/
F=/mnt/pve/nas-proxmox/dump
qmrestore "$F/vzdump-qemu-100-AAAA_MM_JJ-HH_MM_SS.vma.zst" \
  900 --unique 1
# Nettoyage : relis d'abord qm config 900 pour
# confirmer que c'est la copie d'essai
qm config 900
# Apres l'essai : supprime la copie dans
# l'interface, apres avoir verifie son nom
