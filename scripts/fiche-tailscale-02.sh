# Sur la VM Debian ; adapte le port interne après vérification
curl -I http://127.0.0.1:8080
sudo tailscale serve --bg --https=8443 http://127.0.0.1:8080
tailscale serve status
