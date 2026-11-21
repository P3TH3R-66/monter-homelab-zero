tailscale serve --bg --https=8010 http://127.0.0.1:8010
tailscale serve status
# L'app repond maintenant a https://nas.exemple.ts.net:8010
# Meme chose pour Immich, sur le port HTTPS normal :
tailscale serve --bg --https=443 http://127.0.0.1:2283
# https://nas.exemple.ts.net, sans numero de port
