#!/bin/bash

### set up nginx and website
apt update
apt install -y nginx
ufw allow 443
ufw allow 80
ufw allow 12358
systemctl start nginx
systemctl enable nginx
mkdir -p /var/www/eyesopen.top
cp -r html /var/www/eyesopen.top/
cp eyesopen.top /etc/nginx/sites-available/
cp -r ssl/* /etc/ssl/
ln -s /etc/nginx/sites-available/eyesopen.top /etc/nginx/sites-enabled/
nginx -t
systemctl restart nginx

### set up v2ray
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
cp config.json /usr/local/etc/v2ray/
mkdir -p /wonderfulworld
systemctl start v2ray


### add CDN on cloudflare
# https://github.com/bannedbook/fanqiang/blob/master/v2ss/V2Ray%E4%B9%8BTLS+WebSocket+Nginx+CDN%E9%85%8D%E7%BD%AE%E6%96%B9%E6%B3%95.md
