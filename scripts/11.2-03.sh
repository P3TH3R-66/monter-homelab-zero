# Dans le conteneur (entrer : docker compose exec n8n sh) :
# exporter les workflows et les credentials (chiffres)
E=/home/node/.n8n/export
n8n export:workflow --all --separate --output=$E/workflows/
n8n export:credentials --all --separate --output=$E/credentials/

# Restaurer sur une instance neuve (avec la MEME cle de chiffrement)
E=/home/node/.n8n/export
n8n import:workflow --separate --input=$E/workflows/
n8n import:credentials --separate --input=$E/credentials/
