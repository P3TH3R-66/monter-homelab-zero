sudo systemctl edit ollama.service
# dans l'editeur, entre les deux lignes de commentaires :
[Service]
# l'adresse LAN de la VM seulement, pas 0.0.0.0 :
# ni les reseaux Docker ni le tailnet
Environment="OLLAMA_HOST=192.168.1.30:11434"
# puis :
sudo systemctl daemon-reload && sudo systemctl restart ollama
