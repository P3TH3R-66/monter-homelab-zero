# conteneurs en marche, avec healthy ou unhealthy
docker ps
# aussi ceux qui sont arretes
docker ps -a
# journal d'un conteneur, en direct (Ctrl+C pour sortir)
docker logs --tail 50 -f nom
# RAM et CPU de chaque conteneur
docker stats --no-stream
docker exec -it nom sh                     # entrer dans un conteneur
# une erreur ici = pas de healthcheck defini
docker inspect --format '{{.State.Health.Status}}' nom
cd /volume2/docker/app
# valide le compose sans rien lancer ni afficher les secrets
docker compose config --quiet
# mise a jour (apres la copie d'avant)
docker compose pull && docker compose up -d
