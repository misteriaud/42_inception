#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then

	chown -R mysql:mysql /var/lib/mysql;
	chgrp -R mysql /var/lib/mysql;
	mysql_install_db --user=mysql --ldata=/var/lib/mysql;

	cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;

DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_USERPASS}';

CREATE DATABASE ${DB_WORDPRESS_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_WORDPRESS_USERNAME}'@'%' IDENTIFIED by '${DB_WORDPRESS_USERPASS}';
GRANT ALL PRIVILEGES ON ${DB_WORDPRESS_NAME}.* TO '${DB_WORDPRESS_USERNAME}'@'%';

FLUSH PRIVILEGES;
EOF

	# run init.sql
	/usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
	rm -f /tmp/create_db.sql
fi

exec mariadbd-safe --user=mysql
