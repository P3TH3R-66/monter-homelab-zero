# Depuis le dossier de la pile. Export
# officiel : documents + base + reglages
docker compose exec -T paperless document_exporter ../export -c

# Restaurer sur une instance neuve et vide
docker compose exec -T paperless document_importer ../export
