sudo mkdir -p --mode=0755 /usr/share/keyrings
U=https://pkgs.tailscale.com/stable/debian
curl -fsSL "$U/trixie.noarmor.gpg" \
  | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg \
  >/dev/null
curl -fsSL "$U/trixie.tailscale-keyring.list" \
  | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt-get update
sudo apt-get install tailscale
sudo tailscale up
tailscale status
