# environnement de gluetun (extrait,
# valeurs fictives dans .env en 600)
VPN_SERVICE_PROVIDER=ton_fournisseur
VPN_TYPE=wireguard
SERVER_COUNTRIES=Canada
# un port ouvert chez le VPN, si ton fournisseur l'offre
VPN_PORT_FORWARDING=on
# Proton et PIA : seulement les serveurs qui le permettent
PORT_FORWARD_ONLY=on
# Le port change a chaque reconnexion : l'ecrire dans qBittorrent
# par son API, avec authentification (note plus haut)
# le DNS reste dans le tunnel (deja la valeur par defaut)
DNS_UPSTREAM_RESOLVER_TYPE=dot
# optionnel : vide par defaut, a fixer
# seulement si des sites chargent mal
WIREGUARD_MTU=1320
