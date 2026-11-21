# Verifier un lien dur : meme peripherique ET
# meme inode pour les deux fichiers
stat -c '%d %i %h %n' "/volume1/media/torrents/movies/Un film.mkv" \
  "/volume1/media/Movies/Un film (2024)/Un film.mkv"
# Les deux premieres colonnes identiques =
# un seul fichier, deux noms.
# Differentes = copie (normal pour Usenet, pas pour un torrent).
# Preuve complete : stat -c '%d %i' sur les deux
# chemins doit donner les memes nombres.
