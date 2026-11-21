# un dossier pour tous les projets
mkdir -p ~/projets
cd ~/projets
gh repo clone ton-compte/mon-projet
# ouvre le dossier dans la meme fenetre VS Code
code -r mon-projet

# Node
npm install
# VS Code propose « Ouvrir dans le navigateur »
npm run dev

# Python, un environnement par projet
python3 -m venv .venv
source .venv/bin/activate

# Docker
docker compose up -d
docker compose logs -f
