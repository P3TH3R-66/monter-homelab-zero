# Exemples (a adapter)
# App Docker : arreter, restaurer a cote, comparer, remplacer
docker stop sonarr
# pas /tmp : souvent en RAM
mkdir /volume2/docker/_essai-sonarr
tar -xzf sonarr.tar.gz -C /volume2/docker/_essai-sonarr
# liste ce qui differe
diff -rq /volume2/docker/_essai-sonarr/config /volume2/appdata/sonarr
# ... puis remettre a la bonne place, chown -R 1000:1000 (le
# PUID:PGID du conteneur), docker start sonarr

# VM Proxmox : sous un autre numero, sans la demarrer
F=/mnt/pve/nas-proxmox/dump
qmrestore "$F/vzdump-qemu-100-AAAA_MM_JJ-HH_MM_SS.vma.zst" \
  900 --unique 1
