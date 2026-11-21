# Linux, dans le dossier de cette pile uniquement
docker compose config --quiet
docker compose up -d
docker compose ps
docker compose logs --tail 50
