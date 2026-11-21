# Une fois : la liste de reference
ss -Hltnu | awk '{print $1, $5}' | sort -u > ~/ports-reference.txt
# Chaque nuit (cron) : une alerte si un port apparait ou disparait
ss -Hltnu | awk '{print $1, $5}' | sort -u \
  | diff -q ~/ports-reference.txt - >/dev/null \
  || curl -fsS -d "Ports changes sur $(hostname)" \
       https://ntfy.sh/TON-SUJET-SECRET
