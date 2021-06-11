# traefik-reverse-proxy

## Basic Auth

We will do basic auth using `userFile` in Traefik.

Generate `.htpasswd` file.

```bash
sudo apt install apache2-utils # Linux
htpasswd -cb .htpasswd admin <your-password>
```

## Let's Encrypt

```bash
touch acme.json
chmod 600 acme.json
```

## Change domain name for the Traefik Dashboard

In `docker-compose.yaml` file.

```
traefik.http.routers.traefik.rule=Host(`proxy.example.com`)
traefik.http.routers.traefik.tls.domains[0].main=proxy.example.com
```

## Change email for Let's Encrypt SSL renewal.

In `traefik.static.yaml` file.

```
certificatesResolvers.lets-encrypt-resolver.acme.email: john.doe@example.com
```
