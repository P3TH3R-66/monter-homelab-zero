# Seul Home Assistant (IP_HA) joint Whisper et Piper
sudo iptables -I DOCKER-USER -p tcp \
  -m multiport --dports 10200,10300 ! -s IP_HA -j DROP
# Depuis le PC : doit echouer (refuse ou delai)
nc -zv -w 3 ADRESSE_LAN_IA 10300
