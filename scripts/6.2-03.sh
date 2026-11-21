# Lecture seule : y a-t-il deja une traduction pour 100.64.0.0/10 ?
iptables -t nat -S POSTROUTING
# Ajoute la regle seulement si elle n'existe pas (pas de doublon)
iptables -t nat -C POSTROUTING -s 100.64.0.0/10 \
  -d 192.168.1.0/24 -o eth0 -j MASQUERADE 2>/dev/null \
  || iptables -t nat -A POSTROUTING -s 100.64.0.0/10 \
       -d 192.168.1.0/24 -o eth0 -j MASQUERADE
