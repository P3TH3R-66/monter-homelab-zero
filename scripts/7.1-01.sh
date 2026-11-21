# Linux, modification : création unique d’un réseau Docker
docker network create media-backend

# À ajouter au niveau racine de CHAQUE compose concerné
networks:
  media-backend:
    external: true

# À ajouter dans chaque service concerné, sauf qBittorrent
# qui conserve network_mode: service:gluetun
# networks: [media-backend]
