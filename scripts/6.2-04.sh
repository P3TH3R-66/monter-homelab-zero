# Les outils de diagnostic, tous en lecture seule
tailscale whois 100.101.102.103   # a qui appartient cette adresse
tailscale exit-node list          # noeuds de sortie disponibles
tailscale lock status             # etat du verrou du tailnet
tailscale version                 # version du client
# identifiant a donner au support (les journaux du
# client partent deja chez Tailscale)
tailscale bugreport
