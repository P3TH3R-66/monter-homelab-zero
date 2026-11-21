# Sur ton PC : creer une cle, avec une phrase de passe
ssh-keygen -t ed25519 -C "pc-principal"
# La copier sur le NAS
ssh-copy-id -p 2222 admin@192.168.1.10
# Tester la connexion par cle, PUIS couper les mots de passe
# (reglage du NAS, ou PasswordAuthentication no dans sshd_config)
