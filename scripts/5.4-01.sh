# Verifier, puis extraire l'archive
sha256sum kali-linux-X.Y-qemu-amd64.7z
apt install p7zip-full
7z x kali-linux-X.Y-qemu-amd64.7z

# Creer la VM sur le pont du labo, puis importer le disque
qm create 120 --name kali --cores 2 --memory 4096 --ostype l26 \
  --net0 virtio,bridge=vmbr1 --scsihw virtio-scsi-single \
  --agent enabled=1 --vga qxl
qm disk import 120 kali-linux-X.Y-qemu-amd64.qcow2 local-lvm
qm set 120 --scsi0 local-lvm:vm-120-disk-0 --boot order=scsi0
