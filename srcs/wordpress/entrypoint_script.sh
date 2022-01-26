#!/bin/bash
if [ ! -f /var/www/html/wp-config.php ]
then
	mv /wordpress/* /var/www/html/
	mv /wp-config.php /var/www/html/
	sed -ie s/'database_blog'/$MYSQL_WP_DATABASE/g var/www/html/wp-config.php
	sed -ie s/'database_user'/$MYSQL_ADMIN_USER/g var/www/html/wp-config.php
	sed -ie s/'user_password123'/$MYSQL_ADMIN_PASSWORD/g var/www/html/wp-config.php
	chown -R www-data:www-data /var/www/html/*
	rm /var/www/html/wp-config-sample.php
fi

sed -ie 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' \
/etc/php/7.3/fpm/pool.d/www.conf

exec "$@"