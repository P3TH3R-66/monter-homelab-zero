# depuis quand, et la charge (sous le nombre de coeurs = correct)
uptime
# RAM : regarder la colonne "available"
free -m
df -h                          # espace de chaque volume
lsblk                          # disques et partitions
top                            # processus en direct (q pour quitter)
systemctl --failed             # services en echec
systemctl status nom-du-service
journalctl -p err -b           # erreurs depuis le dernier demarrage
# messages du noyau (disques, reseau) ; sudo souvent exige
sudo dmesg -T | tail -n 30
cat /etc/os-release; uname -r  # version du systeme et du noyau
# mises a jour en attente (Debian, Ubuntu, Proxmox,
# Pi) ; rafraichit la liste, n'installe rien
sudo apt update; apt list --upgradable
