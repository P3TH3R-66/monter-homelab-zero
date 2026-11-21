# La chaine, commande par commande (Linux)
ping -c 3 192.168.1.1             # le routeur repond ?
ping -c 3 1.1.1.1                 # Internet par adresse ?
nslookup google.com               # le DNS repond ?
ss -ltnp | grep 8989              # l'app ecoute ?
# le conteneur tourne ? redemarre en boucle ?
docker ps -a
docker logs --tail 50 sonarr      # ce qu'il dit
df -h ; free -h                   # disque plein ? memoire ?
# erreurs du systeme depuis le demarrage
journalctl -p err -b
