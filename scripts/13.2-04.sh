ip -br addr                    # adresses de chaque carte, en court
ip route                       # passerelle par defaut
# ports TCP en ecoute et leur programme
ss -tlnp
ping -c 4 192.168.1.1
dig @192.168.1.22 nas.home.arpa +short
# juste les en-tetes : la page repond-elle ?
curl -sI http://192.168.1.10:8088
nc -zv 192.168.1.10 2222       # le port est-il ouvert ?
# le DNS utilise ; 127.0.0.53 = systemd-
# resolved, voir resolvectl status
cat /etc/resolv.conf
