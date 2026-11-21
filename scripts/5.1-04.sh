auto vmbr1
iface vmbr1 inet manual
    bridge-ports none
    bridge-stp off
    bridge-fd 0
    # aucun "bridge-ports eth..." : ce reseau ne sort pas tout seul
