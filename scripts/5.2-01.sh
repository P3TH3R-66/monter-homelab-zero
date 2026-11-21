# Etat (lecture seule)
pveversion -v                 # versions de tous les paquets
qm list ; pct list            # VM et LXC, avec leur etat
qm config 100                 # reglages d'une VM
pvesm status                  # stockages et place libre
lvs                           # remplissage de LVM-thin (Data%)
pve-firewall status           # pare-feu actif ou non
journalctl -p err -b          # erreurs depuis le demarrage

# Agir
qm shutdown 100               # arret propre (par l'agent invite)
pct enter 101                 # console dans un LXC
qm guest exec 100 -- uptime   # commande dans la VM, par l'agent
qm snapshot 100 avant-maj     # instantane avant une mise a jour
qm rollback 100 avant-maj     # revenir
# nas-proxmox : le nom donne au stockage du NAS (5.1)
vzdump 100 --storage nas-proxmox --mode snapshot --compress zstd
