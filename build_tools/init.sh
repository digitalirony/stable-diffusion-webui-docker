#!/bin/bash
cd /sdui
NEW_HASH="$(/sdui/caddy hash-password --plaintext ${ADMIN_PASS})
sed -i Caddyfile.json "s/\"password\".*/\"password\": \"${NEW_HASH}\",/g"
sed -i Caddyfile.json "s/example.duckdns.org/${DUCK_DOMAIN}.duckdns.org/g"
sed -i Caddyfile.json "s/\"api_token.*/\"api_token\":\"${DUCK_TOKEN}\"/g" 

/usr/bin/supervisord -n -c /sdui/supervisord.conf
