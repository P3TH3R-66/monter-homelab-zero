# /volume2/docker/caddy/Caddyfile : un seul
# certificat pour tous les sous-domaines
*.maison.exemple.ca {
    tls {
        dns cloudflare {env.CF_API_TOKEN}
        # sinon AdGuard repond a la place de
        # Cloudflare et le defi echoue
        resolvers 1.1.1.1
    }

    @jellyfin host jellyfin.maison.exemple.ca
    handle @jellyfin {
        # nom du conteneur, sur le reseau proxy
        reverse_proxy jellyfin:8096
    }

    @pocketid host id.maison.exemple.ca
    handle @pocketid {
        # reseau id : seul Caddy joint Pocket ID (18.2)
        reverse_proxy pocket-id:1411
    }

    handle {
        abort                  # tout autre nom : on coupe
    }
}
