FROM debian:buster

RUN apt-get update

RUN apt-get install -y nginx openssl

# Clear this folder after each apt update
RUN rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=CODAM/CN=idonado" \
	-newkey rsa:2048 -keyout /etc/ssl/private_key.key -out /etc/ssl/certificate.crt;

COPY ./site.conf /etc/nginx/conf.d/default.conf

# Disabling gzip is recommended for ssl
RUN sed -ie 's/gzip on;/gzip off;/g' /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]