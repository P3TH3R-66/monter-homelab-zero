# Linux
ssh-copy-id -i ~/.ssh/id_ed25519.pub -p 2222 admin@192.168.1.10

# Windows PowerShell (une seule fois, sans variable cote serveur)
$cmd = "mkdir -p ~/.ssh && chmod 700 ~/.ssh && " +
  "cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
type $env:USERPROFILE\.ssh\id_ed25519.pub |
  ssh -p 2222 admin@192.168.1.10 $cmd
