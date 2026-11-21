curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
# Cette machine peut aussi donner acces au reseau
# de la maison (routeur de sous-reseau)
# Sur Linux, active d'abord le transfert IP
# (lignes sysctl du chapitre 6.2)
sudo tailscale set --advertise-routes=192.168.1.0/24 \
  --accept-dns=false
