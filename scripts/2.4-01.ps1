# Linux : qui ecoute, sur quelle adresse, quel programme
sudo ss -ltnp                      # TCP
sudo ss -lunp                      # UDP

# Windows : un port repond-il ?
Test-NetConnection 192.168.1.10 -Port 445

# Depuis une autre machine, tous les ports TCP ouverts d'une adresse
# (tes appareils seulement ; ajoute -Pn si
# la cible ne repond pas au ping)
nmap -sT -p- 192.168.1.10
# L'UDP, que -sT ne voit pas (plus lent, demande sudo)
sudo nmap -sU -p 53,123,1900,5353 192.168.1.10
