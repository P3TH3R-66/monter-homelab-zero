# Une fois : la cle (age est dans les depots Debian ;
# sops s'installe depuis ses publications)
sudo apt install age
mkdir -p ~/.config/sops/age
# affiche la cle publique : age1...
age-keygen -o ~/.config/sops/age/keys.txt
chmod 600 ~/.config/sops/age/keys.txt

# Chiffrer le .env d'une app dans un fichier neuf ;
# l'ancienne copie chiffree reste si ca echoue
if sops encrypt --age age1TA_CLE_PUBLIQUE \
     --input-type dotenv --output-type dotenv \
     .env > secrets.enc.env.nouveau &&
   [ -s secrets.enc.env.nouveau ]; then
  mv -f -- secrets.enc.env.nouveau secrets.enc.env
else
  rm -f -- secrets.enc.env.nouveau
  echo "ECHEC : l'ancienne copie chiffree est intacte"
fi

# Sur la machine qui deploie (elle doit avoir
# keys.txt) : dechiffrer dans un fichier neuf,
# remplacer .env, puis demarrer seulement si
# chaque etape a reussi
if (umask 077; sops decrypt --input-type dotenv \
      --output-type dotenv secrets.enc.env \
      > .env.nouveau) &&
   grep -q '=' .env.nouveau &&
   mv -f -- .env.nouveau .env; then
  sudo docker compose up -d
else
  rm -f -- .env.nouveau
  echo "ECHEC : rien n'a demarre ; .env inchange"
fi
