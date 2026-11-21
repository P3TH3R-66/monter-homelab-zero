qm list                        # les VM et leur etat
pct list                       # les conteneurs LXC
qm config 100                  # la config d'une VM
# une commande dans la VM, par l'agent invite
qm guest exec 100 -- uptime
pct enter 101                  # entrer dans un LXC
# espace de chaque stockage (dont le NAS)
pvesm status
pve-firewall status
pveversion -v | head -n 5      # versions de Proxmox
