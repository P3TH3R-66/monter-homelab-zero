# Monter son homelab de zéro : les fichiers du livre

Les scripts, fichiers de configuration et commandes du livre *Monter son homelab de zéro*, de Pierre-Alexandre Plantin (édition de novembre 2026).

Copier du code à partir d'un PDF ou d'un livre papier, ça casse vite : une indentation perdue, un guillemet changé. Ici, chaque bloc est dans son propre fichier, tel qu'imprimé et vérifié.

## Télécharger, sans compte

- Tout d'un coup : bouton **Code**, puis **Download ZIP**, ou directement
  https://github.com/P3TH3R-66/monter-homelab-zero/archive/refs/heads/main.zip
- Un seul fichier : ouvre-le dans `scripts/`, puis **Raw** ou l'icône de téléchargement.

## Comment c'est rangé

- `scripts/` : un fichier par bloc de code, nommé d'après la section du livre (`17.2-01.sh` = section 17.2, premier bloc).
- `scripts/INDEX.txt` : la liste des fichiers avec le titre de leur section.
- `ERRATA.md` : les corrections faites après l'impression.

## Avant de lancer quoi que ce soit

- Les adresses, noms de machines, domaines et comptes sont des **exemples fictifs** (`192.168.1.10`, `maison.exemple.ca`, etc.). Adapte-les à ton réseau.
- Les versions sont écrites `X.Y.Z` : prends la version stable du jour et lis ses notes de version.
- Lis le chapitre qui va avec le fichier. Les scripts qui modifient quelque chose ont un mode `voir` (simulation) : lance-le d'abord.
- Aucun mot de passe, clé ni jeton dans ce dépôt, et il n'y en aura jamais. Ne mets pas les tiens dans une issue.

## Une erreur ?

Ouvre une *issue* avec la page du livre, le fichier et ce que tu as vu. Les corrections confirmées vont dans `ERRATA.md`.

## Licence

Les fichiers de ce dépôt sont sous licence MIT (voir `LICENSE`) : utilise-les, modifie-les, partage-les. Le texte du livre, lui, n'est pas ici et reste protégé (© 2026 Pierre-Alexandre Plantin, tous droits réservés).
