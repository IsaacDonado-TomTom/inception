FROM debian:buster

RUN apt update

RUN apt install -y mariadb-server

# Clear this folder after each apt update
RUN rm -rf /var/lib/apt/lists/*

COPY entrypoint_script.sh /usr/local/bin/
COPY backup.sql /

ENTRYPOINT [ "entrypoint_script.sh" ]

CMD [ "mysqld_safe" ]