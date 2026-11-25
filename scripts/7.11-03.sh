# 1. simulation : compte ce qui serait refait, rien n'est mis en file
sudo docker exec navidrome /app/navidrome artwork reprocess --all --dry-run
# 2. si le compte te convient : lancer pour de vrai
sudo docker exec navidrome /app/navidrome artwork reprocess --all --yes
