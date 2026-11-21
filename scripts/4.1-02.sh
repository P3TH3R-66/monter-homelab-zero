# Meme commande dans PowerShell (Windows) et sous Linux
ssh-keygen -t ed25519 -C "pc-principal"
# Windows : C:\Users\toi\.ssh\id_ed25519 et id_ed25519.pub
# Linux   : ~/.ssh/id_ed25519 et id_ed25519.pub
# son empreinte, pour la reconnaitre plus tard
ssh-keygen -lf ~/.ssh/id_ed25519.pub
# ajouter ou changer la phrase de passe apres coup
ssh-keygen -p -f ~/.ssh/id_ed25519
# Windows PowerShell : si le fichier est
# introuvable, remplace ~ par $env:USERPROFILE
