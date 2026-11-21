# .env d'Immich (extrait, valeurs fictives)
IMMICH_VERSION=vX.Y.Z               # epinglee, jamais "release"
UPLOAD_LOCATION=/volume1/photos/immich
# la base sur le SSD
DB_DATA_LOCATION=/volume2/appdata/immich/postgres
DB_PASSWORD=une_phrase_aleatoire_longue

# docker-compose.yml : le port lie au NAS seulement
    ports:
      - "127.0.0.1:2283:2283"
