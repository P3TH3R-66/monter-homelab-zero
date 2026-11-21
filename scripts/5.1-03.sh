# Trouver l'identifiant de la cle (vendor:product)
lsusb
# Exemple de sortie : Bus 001 Device 004: ID 0e8d:7612 ...

# Attribuer la cle a la VM numero 210
qm set 210 -usb0 host=0e8d:7612
