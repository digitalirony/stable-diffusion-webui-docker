#!/bin/bash

if [ ! -d ./bin ]
then
	mkdir ./bin
fi
cd bin
wget "https://github.com/caddyserver/xcaddy/releases/download/v0.3.1/xcaddy_0.3.1_linux_amd64.tar.gz" 

tar -zxf xcaddy_*.tar.gz


rm -rf xcaddy*.tar.gz
rm -rf LICENSE
rm -rf README.md
./xcaddy build --with github.com/caddy-dns/duckdns --with github.com/mholt/caddy-dynamicdns
mv caddy ../build_tools
 
cd ..
docker compose build

