FROM		alpine:3.16.3
RUN			apk add php php-fpm
# INSTALL WORDPRESS
RUN			cd /usr/share \
			&& wget http://wordpress.org/latest.tar.gz \
			&& tar -xzvf latest.tar.gz \
			&& rm latest.tar.gz
COPY		conf/php-fpm.conf /etc/php8/php-fpm.conf

ENTRYPOINT	["php-fpm8"]

EXPOSE 9000
