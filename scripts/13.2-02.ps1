# Reseau
# adresses, passerelle, DNS de chaque carte
ipconfig /all
# quels DNS chaque carte utilise
Get-DnsClientServerAddress -AddressFamily IPv4
ping -n 10 192.168.1.10                          # pertes et delai
# par ou passent les paquets
tracert 1.1.1.1
# le port SSH du NAS repond-il ?
Test-NetConnection 192.168.1.10 -Port 2222
# bloque = 0.0.0.0
Resolve-DnsName pub.exemple.com -Server 192.168.1.22
# appareils vus recemment sur le reseau
arp -a

# Systeme
# dernier demarrage
(Get-CimInstance Win32_OperatingSystem).LastBootUpTime
# CPU = secondes cumulees depuis le
# lancement, pas la charge du moment
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
Get-PhysicalDisk | Select-Object FriendlyName, HealthStatus, Size
# 30 dernieres erreurs et critiques
Get-WinEvent -MaxEvents 30 -FilterHashtable @{
  LogName='System'; Level=1,2 }
Get-Service | Where-Object Status -eq Running

# Fichiers
# comparer avec la page de telechargement
Get-FileHash .\image.iso -Algorithm SHA256
Get-ChildItem C:\Dossier -Recurse -Filter *.log
Get-Content .\journal.log -Tail 20 -Wait
# cree le dossier s'il manque
New-Item -ItemType Directory C:\_A-SUPPRIMER -Force | Out-Null
# deplacer plutot qu'effacer
Move-Item .\vieux.txt C:\_A-SUPPRIMER\

# Securite (certaines demandent PowerShell en administrateur)
Get-MpComputerStatus |
  Select-Object RealTimeProtectionEnabled,
    AntivirusSignatureLastUpdated
Get-NetFirewallProfile |
  Select-Object Name, Enabled, DefaultInboundAction
# admin : etat du chiffrement
Get-BitLockerVolume
# liste les mises a jour (n'installe rien)
winget upgrade

# Vers le NAS
ssh -p 2222 admin@192.168.1.10
# -P majuscule pour scp ; rien apres le : = dossier perso de admin
scp -P 2222 .\script.sh admin@192.168.1.10:
# script local : lis-le avant
powershell -ExecutionPolicy Bypass -File .\script.ps1 voir
