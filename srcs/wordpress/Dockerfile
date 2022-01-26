FROM debian:buster

# updating packages
RUN apt-get update && apt-get install -y php7.3 php-fpm php-cli wget curl php-mysql php-mbstring php-xml sendmail mariadb-client

# Clear this folder after each apt update
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /run/php

COPY ./wordpress.tar.gz .

RUN tar -xzvf wordpress.tar.gz && rm wordpress.tar.gz
RUN chmod 644 ./wordpress/wp-config.php

COPY ./entrypoint_script.sh /usr/local/bin/
COPY ./wp-config.php .

ENTRYPOINT [ "entrypoint_script.sh" ]

CMD [ "./usr/sbin/php-fpm7.3", "-F" ]