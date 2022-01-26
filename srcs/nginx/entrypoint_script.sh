#!/bin/bash
sed -ie s/'$WEBSITE_URL'/'idonado.42.fr'/g /etc/nginx/sites-available/site.conf

openssl req -x509 -nodes -days 365 -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=CODAM/CN=idonado" \
	-newkey rsa:2048 -keyout /etc/ssl/private_key.key -out /etc/ssl/certificate.crt;

# Unlink default nginx website
 unlink /etc/nginx/sites-enabled/default
# Link our new site
ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/

# Disabling gzip is recommended for ssl
sed -ie 's/gzip on;/gzip off;/g' /etc/nginx/nginx.conf

exec "$@"