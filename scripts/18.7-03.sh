# mot de passe long, au hasard : il ne servira plus
sudo docker exec -it ntfy ntfy user add envoi
sudo docker exec ntfy ntfy access envoi 'homelab-*' write-only
sudo docker exec ntfy ntfy token add envoi
# Le jeton (tk_...) va dans un fichier en 600, une seule ligne :
# Authorization: Bearer tk_...
sudo install -m 600 /dev/null /root/ntfy-entete
sudo nano /root/ntfy-entete
