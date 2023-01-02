# traefik-reverse-proxy

## Local

### Generate SSL cert

1. Install [minica](https://github.com/jsha/minica)
   1. `brew install minica`
2. `cd certs`
3. `minica --domains 'proxy.lvh.me'`
4. `sudo security add-trusted-cert -d -r trustAsRoot -p ssl -k /Library/Keychains/System.keychain proxy.lvh.me/cert.pem`

You can run steps 3. & 4. for as many other sub-domains as you need for any other services.

## Production

### Basic Auth

We will do basic auth using `userFile` in Traefik.

Generate `.htpasswd` file.

```bash
sudo apt install apache2-utils # Linux
htpasswd -cb .htpasswd admin <your-password>
```

### Let's Encrypt

```bash
touch acme.json
chmod 600 acme.json
```

### Change domain name for the Traefik Dashboard

In `docker-compose.production.yaml` file.

```
traefik.http.routers.rev-proxy.rule=Host(`proxy.example.com`)
```

### Change email for Let's Encrypt SSL renewal.

In `docker-compose.production.yaml` file.

```
TRAEFIK_CERTIFICATESRESOLVERS_LETSENCRYPTRESOLVER_ACME_EMAIL=john.doe@example.com
```
