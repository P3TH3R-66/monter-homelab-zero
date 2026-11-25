# config.alloy : lit les journaux de tous
# les conteneurs de la machine
discovery.docker "linux" {
  host = "unix:///var/run/docker.sock"
}

discovery.relabel "docker" {
  targets = []
  rule {
    source_labels = ["__meta_docker_container_name"]
    regex         = "/(.*)"
    target_label  = "service_name"
  }
}

loki.source.docker "default" {
  host          = "unix:///var/run/docker.sock"
  targets       = discovery.docker.linux.targets
  relabel_rules = discovery.relabel.docker.rules
  forward_to    = [loki.write.local.receiver]
}

loki.write "local" {
  endpoint {
    url = "http://loki:3100/loki/api/v1/push"
  }
}
