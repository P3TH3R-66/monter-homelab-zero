#!/usr/bin/env bash
# gabarit.sh : vieux journaux vers une corbeille datee
# Usage : bash gabarit.sh voir | appliquer | retour
set -euo pipefail
MODE="${1:-voir}"
# Sans deux-points : CIBLE= (vide) reste vide,
# et la garde plus bas refuse de tourner
CIBLE="${CIBLE-/volume2/appdata/monapp/logs}"
CORBEILLE="${CORBEILLE-/volume2/corbeille}"
CORBEILLE="${CORBEILLE:?CORBEILLE vide}"
JOURS=30
STAMP="$(date +%Y%m%d-%H%M%S)"
NOTE="$CORBEILLE/dernier-deplacement.txt"

# Gardes : chemin reel, jamais la racine ni un volume
CIBLE="$(readlink -f -- "${CIBLE:?CIBLE vide}")" ||
  { echo "REFUS : chemin introuvable"; exit 1; }
case "$CIBLE" in
  /|/volume1|/volume2)
    echo "REFUS : cible trop large ($CIBLE)"; exit 1;;
esac
[ -d "$CIBLE" ] || { echo "REFUS : $CIBLE absent"; exit 1; }

case "$MODE" in
  voir)
    echo "Seraient deplaces (plus de $JOURS jours) :"
    find "$CIBLE" -maxdepth 1 -type f -name '*.log' \
      -mtime +"$JOURS" -print
    echo "Rien n'a ete modifie (mode voir)."
    ;;
  appliquer)
    mkdir -p "$CORBEILLE"
    DEST="$(mktemp -d "$CORBEILLE/logs-$STAMP-XXXX")"
    N=0
    while IFS= read -r -d '' F; do
      mv -n -- "$F" "$DEST"/ && N=$((N + 1))
    done < <(find "$CIBLE" -maxdepth 1 -type f \
      -name '*.log' -mtime +"$JOURS" -print0)
    # Preuve : plus aucun vieux journal ne doit rester
    RESTE="$(find "$CIBLE" -maxdepth 1 -type f \
      -name '*.log' -mtime +"$JOURS" | wc -l)"
    if [ "$N" -eq 0 ] && [ "$RESTE" -eq 0 ]; then
      rmdir "$DEST"; echo "Rien a deplacer."; exit 0
    fi
    # Le lot garde son dossier d'origine
    printf '%s\n' "$CIBLE" > "$DEST/.origine"
    printf '%s\n' "$DEST" > "$NOTE"
    echo "Deplaces vers $DEST : $N fichier(s)."
    if [ "$RESTE" -gt 0 ]; then
      echo "Restes dans $CIBLE : $RESTE (droits ?)"
      exit 2
    fi
    ;;
  retour)
    [ -f "$NOTE" ] ||
      { echo "REFUS : aucun lot note"; exit 1; }
    DEST="$(cat "$NOTE")"
    [ -f "$DEST/.origine" ] ||
      { echo "REFUS : lot sans origine ($DEST)"; exit 1; }
    ORIG="$(cat "$DEST/.origine")"
    if [ "$ORIG" != "$CIBLE" ]; then
      echo "REFUS : ce lot vient de $ORIG"
      exit 1
    fi
    REMIS=0
    # Meme inventaire qu'a l'aller (find), donc
    # aussi les noms qui commencent par un point
    while IFS= read -r -d '' F; do
      B="$(basename -- "$F")"
      if [ -e "$ORIG/$B" ]; then
        echo "COLLISION : $B existe deja"
      else
        mv -n -- "$F" "$ORIG"/ && REMIS=$((REMIS + 1))
      fi
    done < <(find "$DEST" -maxdepth 1 -type f \
      -name '*.log' -print0)
    echo "Remis dans $ORIG : $REMIS fichier(s)."
    # Preuve : on recompte ce qui reste dans le lot
    RESTE="$(find "$DEST" -maxdepth 1 -type f \
      -name '*.log' | wc -l)"
    if [ "$RESTE" -gt 0 ]; then
      echo "Restes dans $DEST : $RESTE (a la main)."
      exit 2
    fi
    ;;
  *) echo "Usage : bash $0 voir|appliquer|retour"; exit 1;;
esac
