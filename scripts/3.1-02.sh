# Connexion en SSH (remplace l'adresse et le port)
ssh -p 2222 admin@192.168.1.10

# Arborescence conseillee
# SSD : un dossier par app (compose + .env)
/volume2/docker/
/volume2/docker/jellyfin/
/volume2/appdata/           # SSD : les donnees de chaque app
/volume1/media/             # disques durs : films, series, musique
/volume1/media/Movies/
/volume1/media/TV/
/volume1/media/torrents/    # les telechargements en cours
