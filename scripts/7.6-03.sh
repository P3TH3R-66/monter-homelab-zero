# Le pays vu de l'exterieur, depuis le reseau de gluetun
docker exec gluetun wget -qO- https://ipinfo.io/country

# Le port recu du fournisseur
docker exec gluetun cat /tmp/gluetun/forwarded_port

# Coupe-circuit : suivre le test complet de la section 7.3
