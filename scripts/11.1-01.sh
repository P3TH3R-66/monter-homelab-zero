# Sur une VM Linux du mini PC no 2
curl -fsSL https://ollama.com/install.sh | sh

# Telecharger et lancer un modele de 4 a 8 milliards de parametres
ollama pull qwen3:8b                # environ 5 Go a telecharger
ollama run qwen3:8b "Resume-moi ce texte en trois points"
# attendu : {"version":"..."}
curl http://127.0.0.1:11434/api/version
