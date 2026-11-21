# Dans le labo seulement : decouvrir les machines du reseau d'essai
sudo nmap -sn 10.66.0.0/24

# Les services et versions d'UNE cible du labo (les
# 65 535 ports : compte quelques minutes)
sudo nmap -sV -p- 10.66.0.50

# Une faille publiee pour une version trouvee ?
searchsploit vsftpd 2.3.4
