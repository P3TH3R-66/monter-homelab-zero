# temperature (sous 70 degres au repos, c'est bien)
vcgencmd measure_temp
# 0x0 = ni bride ni sous-alimente depuis le demarrage
vcgencmd get_throttled
sudo shutdown -h now           # arret propre avant de debrancher
sudo reboot
