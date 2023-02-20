FROM		alpine:3.16.3

ARG			DB_ROOT_USERPASS=default_rootpass \
			DB_WORDPRESS_NAME=wordpress \
			DB_WORDPRESS_USERNAME=wpuser \
			DB_WORDPRESS_USERPASS=wppass

ENV			DB_ROOT_USERPASS=${DB_ROOT_USERPASS} \
			DB_WORDPRESS_NAME=${DB_WORDPRESS_NAME} \
			DB_WORDPRESS_USERNAME=${DB_WORDPRESS_USERNAME} \
			DB_WORDPRESS_USERPASS=${DB_WORDPRESS_USERPASS}

RUN			apk add mysql mysql-client
COPY		conf/my.cnf /etc/my.cnf
RUN			chown -R mysql:mysql /var/lib/mysql
RUN			chgrp -R mysql /var/lib/mysql
RUN			mysql_install_db --user=mysql --ldata=/var/lib/mysql
COPY		tools/mariadb_secure_install.sh .
RUN			sh mariadb_secure_install.sh

USER		mysql
ENTRYPOINT	["mariadbd-safe"]
# EXPOSE 		3306
