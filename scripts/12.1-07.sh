# En SSH sur le NAS (root). « quotas not enabled » = coupes
btrfs qgroup show /volume1
# ligne Metadata : utilise / alloue
btrfs filesystem usage -T /volume1
# Couper les quotas : les quotas de partage de
# l'interface du NAS cessent de marcher
btrfs quota disable /volume1
