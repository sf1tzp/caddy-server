deploy HOST:
  #!/usr/bin/env bash
  set -euo pipefail
  ssh {{HOST}} -C "mkdir -p ~/caddyfiles"
  scp Caddyfile {{HOST}}:~/Caddyfile
  scp caddy-compose.yaml {{HOST}}:~/caddy-compose.yaml
  ssh {{HOST}} -C "~/.local/bin/nerdctl compose -f ~/caddy-compose.yaml down"
  ssh {{HOST}} -C "~/.local/bin/nerdctl compose -f ~/caddy-compose.yaml up -d"

reload HOST:
  ssh {{HOST}} -C "~/.local/bin/nerdctl exec caddy -- caddy reload --config /etc/caddy/Caddyfile"

