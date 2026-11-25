# Une fois : creer le depot dans un seau B2, avec
# une cle d'application limitee a ce seau
# La cle passe par une saisie masquee, jamais dans la commande
# Point de terminaison S3 : affiche sur la page du seau
read -rsp "Cle B2 (secret) : " AWS_SECRET_ACCESS_KEY; echo
export AWS_SECRET_ACCESS_KEY
kopia repository create s3 --bucket=NOM_DU_SEAU \
  --endpoint=s3.REGION.backblazeb2.com \
  --access-key=ID_DE_CLE
unset AWS_SECRET_ACCESS_KEY
# Kopia demande le mot de passe du depot : gestionnaire ET papier
kopia policy set --global \
  --keep-daily=14 --keep-weekly=8 --keep-monthly=12

# Ensuite
kopia snapshot create /volume1/documents
kopia snapshot list /volume1/documents
# pas /tmp : souvent en RAM
kopia snapshot restore ID_DE_LA_SAUVEGARDE \
  /volume1/_essai-restauration
# Puis comparer un fichier restaure avec l'original
sha256sum /volume1/_essai-restauration/un-fichier.pdf \
  /volume1/documents/un-fichier.pdf
