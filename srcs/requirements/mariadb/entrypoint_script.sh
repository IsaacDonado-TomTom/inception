#!/bin/bash
sed -ie 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

if [ ! -d /var/lib/mysql/$DATABASE_WP ]
then
service mysql start

mysql --user=root <<EOF
UPDATE mysql.user SET Password=PASSWORD('$WP_DB_ROOT_PASSWORD') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

mysql --user=root --password=$WP_DB_ROOT_PASSWORD <<EOF
CREATE DATABASE IF NOT EXISTS $DATABASE_WP;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$WP_DB_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $DATABASE_WP.* TO '$WP_DB_ADMIN_USER'@'%' IDENTIFIED BY '$WP_DB_ADMIN_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

service mysql stop
fi

exec "$@"