# Une fois : le sujet secret dans son fichier (root:nut, 640)
sudo install -m 640 -o root -g nut /dev/null /etc/nut/ntfy-sujet
# une seule ligne : ton sujet
sudo nano /etc/nut/ntfy-sujet
