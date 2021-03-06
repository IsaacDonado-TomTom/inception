#!/bin/bash
if [ ! -f /var/www/html/wp-config.php ]
then
	mv /wordpress/* /var/www/html/
	mv /wp-config.php /var/www/html/
	sed -ie s/'database_blog'/$DATABASE_WP/g var/www/html/wp-config.php
	sed -ie s/'database_user'/$WP_DB_ADMIN_USER/g var/www/html/wp-config.php
	sed -ie s/'user_password123'/$WP_DB_ADMIN_PASSWORD/g var/www/html/wp-config.php
	chown -R www-data:www-data /var/www/html/*
fi

sed -ie 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

exec "$@"