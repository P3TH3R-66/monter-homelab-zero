# Metadonnees a plus de 90 % ET moins de 10
# Go non alloues sur les disques
(sum by (uuid) (node_btrfs_used_bytes{block_group_type="metadata"})
  / sum by (uuid)
      (node_btrfs_size_bytes{block_group_type="metadata"}) > 0.90)
and on (uuid)
(sum by (uuid) (node_btrfs_device_unused_bytes) < 10e9)
