# /volume2/docker/caddy/Dockerfile
# (verifie la version sur Docker Hub)
FROM caddy:X.Y.Z-builder AS builder
RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:X.Y.Z
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
