#!/bin/bash
cd /sdui
NEW_HASH="$(/sdui/caddy hash-password --plaintext ${ADMIN_PASS})"
sed -i "s~\"password\".*~\"password\": \"${NEW_HASH}\"\,~g" Caddyfile.json
sed -i "s/example\.duckdns\.org/${DUCK_DOMAIN}.duckdns.org/g" Caddyfile.json
sed -i "s/\"api_token.*/\"api_token\":\"${DUCK_TOKEN}\"/g" Caddyfile.json

/usr/bin/supervisord -n -c /sdui/supervisord.conf
