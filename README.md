# caddy-server

This standalone caddy deployment makes it easy to host multiple independent services:

```
 >  tree ~
/home/deployer
├── caddy-compose.yaml
├── Caddyfile
├── caddyfiles
│   ├── service-a.caddy
│   └── service-b.caddy
├── service-a-compose.yaml
└── service-b-compose.yaml
```

Caddy will use service name resolution for compose stacks in the *same directory* and network.

For example:

```
# Docker compose yaml service-a-compose.yaml
services:
  service-a: # service name
    networks:
        - caddy_network
    ...

networks:
  caddy_network:
    driver: bridge
```

```
# Caddy configuration service-a.caddy
service-a {
    ...
    reverse_proxy service-a:3000 { # resolve to the 'service-a' service
    ...
    }

}
```
