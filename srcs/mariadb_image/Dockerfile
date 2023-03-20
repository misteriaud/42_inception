FROM		alpine:3.16.3

ARG			DB_ROOT_USERPASS \
			DB_WORDPRESS_NAME \
			DB_WORDPRESS_USERNAME \
			DB_WORDPRESS_USERPASS

ENV			DB_ROOT_USERPASS=${DB_ROOT_USERPASS} \
			DB_WORDPRESS_NAME=${DB_WORDPRESS_NAME} \
			DB_WORDPRESS_USERNAME=${DB_WORDPRESS_USERNAME} \
			DB_WORDPRESS_USERPASS=${DB_WORDPRESS_USERPASS}

RUN			apk add mysql mysql-client
COPY		conf/my.cnf /etc/my.cnf
# RUN			chown -R mysql:mysql /var/lib/mysql
# RUN			chgrp -R mysql /var/lib/mysql
# RUN			mysql_install_db --user=mysql --ldata=/var/lib/mysql
COPY		tools/mariadb_launcher.sh .
# RUN			sh mariadb_secure_install.sh

# USER		mysql
ENTRYPOINT	["sh", "mariadb_launcher.sh"]
# EXPOSE 		3306
