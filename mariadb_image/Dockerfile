FROM		alpine:3.16.3
RUN			apk add mysql 
COPY		conf/my.cnf /etc/my.cnf
RUN			chown -R mysql:mysql /var/lib/mysql
RUN			chgrp -R mysql /var/lib/mysql
RUN			mysql_install_db --user=mysql --ldata=/var/lib/mysql

VOLUME		["/var/lib/mysql"]

USER		mysql
ENTRYPOINT	["mariadbd"] 
EXPOSE 		3306
