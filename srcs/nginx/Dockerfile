FROM debian:buster

RUN apt-get update

RUN apt-get install -y nginx openssl

# Clear this folder after each apt update
RUN rm -rf /var/lib/apt/lists/*

COPY ./site.conf /etc/nginx/sites-available/
COPY ./entrypoint_script.sh /usr/local/bin/

ENTRYPOINT [ "entrypoint_script.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]