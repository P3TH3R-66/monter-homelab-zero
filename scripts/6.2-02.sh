# Sur la machine de sortie (Linux)
echo 'net.ipv4.ip_forward = 1' \
  | sudo tee /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' \
  | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
sudo tailscale set --advertise-exit-node
# Puis approuver dans la console (Edit route settings)

# Sur le client
tailscale set --exit-node=nas --exit-node-allow-lan-access=true
tailscale set --exit-node=          # revenir a la normale
