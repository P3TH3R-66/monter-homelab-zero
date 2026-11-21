# Sur l'hote Proxmox
tar -xSvf Whonix*.libvirt.xz
qm disk import 130 Whonix-Gateway*.qcow2 local-lvm
qm disk import 131 Whonix-Workstation*.qcow2 local-lvm
