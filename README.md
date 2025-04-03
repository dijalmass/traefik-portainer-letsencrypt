# Traefik + Portainer + Let's Encrypt

This project sets up a Docker infrastructure with Traefik as a reverse proxy, Portainer for container management, and automatic SSL certificate generation using Let's Encrypt.

## Prerequisites

- Docker and Docker Compose installed
- A domain name pointing to your server
- Ports 80 and 443 open on your firewall

## Quick Start

### 1. Configure Environment Variables

Create the `.env` file with your specific configuration:

```
# Traefik Configuration
DOMAIN_NAME=yourdomain.com
EMAIL_ADDRESS=your-email@example.com

# Traefik Dashboard Credentials
DASHBOARD_USER=your-username
DASHBOARD_PASSWORD=your-password
```

### 3. Run

Launch the entire stack with this command:

```bash
chmod +x install.sh && ./install.sh
```

## Components

### Traefik

Traefik serves as the entry point for all HTTP/HTTPS traffic and routes requests to the appropriate containers. The Traefik dashboard is available at `https://traefik.yourdomain.com` (protected by basic authentication).

### Portainer

Portainer provides a web interface to manage your Docker containers, images, networks, and volumes. Access it at `https://portainer.yourdomain.com`.

### Let's Encrypt

The stack automatically obtains and renews SSL certificates for your domains using Let's Encrypt.

## Configuration Details

### Traefik Labels

To add a new service behind Traefik, use these Docker labels in your service definition:

```yaml
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.myservice.rule=Host(`myservice.yourdomain.com`)"
  - "traefik.http.routers.myservice.entrypoints=websecure"
  - "traefik.http.routers.myservice.tls.certresolver=myresolver"
  - "traefik.http.services.myservice.loadbalancer.server.port=8080"
```

### Volume Management

- `portainer-data`: Stores Portainer data

## Maintenance

### View Logs

```bash
docker-compose logs -f traefik
docker-compose logs -f portainer
```

### Update the Stack

```bash
docker-compose pull
docker-compose up -d
```

### Restart Services

```bash
docker-compose restart traefik
docker-compose restart portainer
```

## Troubleshooting

### Certificate Issues

If you're having trouble with certificates:

1. Start with the staging ACME server to avoid rate limits
2. Check Traefik logs for certificate errors
3. Ensure your domain is correctly pointing to your server

### Network Issues

If containers can't communicate:

```bash
docker network inspect traefik
```

## Security Considerations

- The Traefik dashboard is protected with basic authentication
- All services use HTTPS with Let's Encrypt certificates
- Consider adding additional security measures like IP whitelisting for admin interfaces

## License

This project is licensed under the MIT License.

## Author
[Dijalma Silva](https://github.com/dijalmass)