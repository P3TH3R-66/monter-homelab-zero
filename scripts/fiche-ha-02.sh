ls -lh /var/lib/vz/template/iso/haos.qcow2
pvesm status
qm config 120
qm disk import 120 /var/lib/vz/template/iso/haos.qcow2 local-lvm
