# X.Y = la version telechargee ; 100 = numero de la VM
xz -d haos_ova-X.Y.qcow2.xz
qm disk import 100 haos_ova-X.Y.qcow2 local-lvm
# Puis : Materiel, disque inutilise, Ajouter
# ; Options, Ordre de demarrage
