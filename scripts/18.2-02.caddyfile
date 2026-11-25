@sonarr host sonarr.maison.exemple.ca
handle @sonarr {
    forward_auth authelia:9091 {
        uri /api/authz/forward-auth
        copy_headers Remote-User Remote-Groups Remote-Email Remote-Name
    }
    reverse_proxy sonarr:8989
}
