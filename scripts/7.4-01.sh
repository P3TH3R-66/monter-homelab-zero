# compose : donner la puce graphique Intel au conteneur
    devices:
      - /dev/dri:/dev/dri
    # remplace par : getent group render |
    # cut -d: -f3 (parfois "video")
    group_add: ["GID_RENDER"]
# Verifier ensuite : docker exec jellyfin
# /usr/lib/jellyfin-ffmpeg/vainfo
