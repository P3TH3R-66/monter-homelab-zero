# Monter son homelab de zéro : les fichiers du livre

Les scripts, fichiers de configuration et commandes du livre *Monter son homelab de zéro*, de Pierre-Alexandre Plantin (édition de novembre 2026).

Copier du code à partir d'un PDF ou d'un livre papier, ça casse vite : une indentation perdue, un guillemet changé. Ici, chaque bloc est dans son propre fichier, tel qu'imprimé et vérifié.

## Télécharger, sans compte

- Tout d'un coup : bouton **Code**, puis **Download ZIP**, ou directement
  https://github.com/P3TH3R-66/monter-homelab-zero/archive/refs/heads/main.zip
- Un seul fichier : ouvre-le dans `scripts/`, puis **Raw** ou l'icône de téléchargement.

## Comment c'est rangé

- `scripts/` : un fichier par bloc de code, nommé d'après la section du livre (`17.2-01.sh` = section 17.2, premier bloc). L'extension suit le contenu : `.yaml`, `.env`, `.Caddyfile`, `.promql`, `.hujson`, `.ps1`, `.py`, `.sh`.
- `scripts/INDEX.txt` : pour chaque fichier, son type, la machine où il sert, sa page dans le livre broché, le nom à lui donner une fois téléchargé (par exemple `18.4-03-secrets.sh` devient `secrets.sh`, un fichier `.env` devient `.env`) et s'il a un mode `voir`.
- Quand un exemple du livre compte deux fichiers (un compose et son `.env`), ils sont ici séparés : `11.2-01-compose.yaml` et `11.2-01.env`.
- `ERRATA.md` : les corrections faites après l'impression.

## Avant de lancer quoi que ce soit

- Les adresses, noms de machines, domaines et comptes sont des **exemples fictifs** (`192.168.1.10`, `maison.exemple.ca`, etc.). Adapte-les à ton réseau.
- Les versions sont écrites `X.Y.Z` : prends la version stable du jour et lis ses notes de version.
- Lis le chapitre qui va avec le fichier. Seuls les scripts marqués `oui` dans la colonne « mode voir » de l'index ont une simulation : lance-la d'abord. Les autres fichiers sont des commandes à lire et à lancer une ligne à la fois, ou des fichiers de configuration à relire avant usage.
- Un fichier `.env` contient des secrets : renomme-le `.env`, `chmod 600`, et ne le mets jamais dans Git.
- Aucun mot de passe, clé ni jeton dans ce dépôt, et il n'y en aura jamais. Ne mets pas les tiens dans une issue.

## Quelle version ?

L'étiquette `edition-2026-11` (onglet *Releases*) correspond au livre imprimé. La branche `main` peut recevoir des corrections ensuite : elles sont listées dans `ERRATA.md`.

## Une erreur ?

Ouvre une *issue* avec la page du livre, le fichier et ce que tu as vu. Les corrections confirmées vont dans `ERRATA.md`.

## Licence

Les fichiers de ce dépôt sont sous licence MIT (voir `LICENSE`) : utilise-les, modifie-les, partage-les. Le texte du livre, lui, n'est pas ici et reste protégé (© 2026 Pierre-Alexandre Plantin, tous droits réservés).
