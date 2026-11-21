sudo docker compose config --quiet   # aucune sortie = fichier valide
sudo docker compose up -d
# attendu : service web, statut "Up"
sudo docker compose ps
curl -I http://127.0.0.1:8088        # attendu : HTTP/1.1 200 OK
