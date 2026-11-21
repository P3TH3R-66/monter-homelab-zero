# Windows, PowerShell en administrateur (une fois)
Set-Service ssh-agent -StartupType Automatic
Start-Service ssh-agent
# puis, en session normale
ssh-add $env:USERPROFILE\.ssh\id_ed25519

# Linux
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
