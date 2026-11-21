# Une fois : la cle (age est dans les depots Debian ;
# sops s'installe depuis ses publications)
sudo apt install age
mkdir -p ~/.config/sops/age
# affiche la cle publique : age1...
age-keygen -o ~/.config/sops/age/keys.txt
chmod 600 ~/.config/sops/age/keys.txt
