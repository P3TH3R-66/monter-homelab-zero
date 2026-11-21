# Les cles et mots de passe dans un .env
# lisible par son proprietaire seulement
cd /volume2/docker/downloads
# WIREGUARD_PRIVATE_KEY=... (la vraie valeur, jamais affichee)
nano .env
chmod 600 .env
# doit afficher -rw------- : lecture et
# ecriture pour le proprietaire seulement
ls -l .env
