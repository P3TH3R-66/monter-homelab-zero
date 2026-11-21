# apt install nut-client ; puis /etc/nut/nut.conf
MODE=netclient

# /etc/nut/upsmon.conf (proprio root:nut, droits 640)
# sudo chown root:nut /etc/nut/upsmon.conf ;
# sudo chmod 640 /etc/nut/upsmon.conf
MONITOR ups@192.168.1.10 1 utilisateur_nut MOT_DE_PASSE secondary
MINSUPPLIES 1
SHUTDOWNCMD "/sbin/shutdown -h +0"
# ton script d'alerte (ntfy), executable : sudo chmod 755 le fichier
NOTIFYCMD /usr/local/sbin/onduleur-alerte.sh
NOTIFYFLAG ONBATT SYSLOG+EXEC
NOTIFYFLAG ONLINE SYSLOG+EXEC
NOTIFYFLAG LOWBATT SYSLOG+EXEC
NOTIFYFLAG FSD SYSLOG+EXEC
NOTIFYFLAG COMMBAD SYSLOG+EXEC     # l'onduleur ne repond plus
NOTIFYFLAG NOCOMM SYSLOG+EXEC
DEADTIME 25

# Verifier
# OL = sur secteur, OB = sur batterie
upsc ups@192.168.1.10 ups.status
upsc ups@192.168.1.10 battery.runtime   # autonomie en secondes

# Demarrer le moniteur et le garder actif
# au demarrage (Debian, Ubuntu)
sudo systemctl enable --now nut-monitor
# doit dire "active (running)"
systemctl status nut-monitor
# chercher "Communications with UPS ... established"
journalctl -u nut-monitor -n 30
