# Verifier que le VPN tient (les deux adresses doivent differer)
docker exec qbittorrent curl -s https://ipinfo.io/ip
curl -s https://ipinfo.io/ip
# Le port est-il redirige ? (cherche la ligne "port forwarded")
docker logs gluetun 2>&1 | grep -i "port forward" | tail -n 3
# Le serveur de controle (port 8000, route /v1/portforward) exige une
# authentification par defaut : sans elle,
# la reponse est un refus 401.
