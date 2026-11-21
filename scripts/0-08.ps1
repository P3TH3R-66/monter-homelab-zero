# PowerShell depuis chaque zone, en adaptant les cibles
Test-NetConnection 192.168.1.10 -Port 445
Test-NetConnection 192.168.1.20 -Port 8006
Test-NetConnection 1.1.1.1 -Port 443

# Linux, outil nmap déjà installé, sur tes appareils seulement
# -Pn teste les ports même si la cible ne répond pas au ping
nmap -Pn -sT -p 22,443,445,8006 192.168.1.20
