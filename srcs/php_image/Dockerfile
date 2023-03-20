FROM		alpine:3.16.3
RUN			apk add php8 php8-fpm php8-phar php8-mysqli php8-iconv curl mariadb-client
COPY		conf/php-fpm.conf /etc/php8/php-fpm.conf
RUN			curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp
COPY		tools/php_launcher.sh .

ARG			DB_ROOT_USERPASS \
			DB_WORDPRESS_NAME \
			DB_WORDPRESS_USERNAME \
			DB_WORDPRESS_USERPASS \
			DOMAIN_NAME \
			WP_TITLE \
			WP_ADMIN_NAME \
			WP_ADMIN_PASS \
			WP_ADMIN_EMAIL \
			WP_USER_NAME \
			WP_USER_PASS \
			WP_USER_EMAIL

ENV			DB_ROOT_USERPASS=${DB_ROOT_USERPASS} \
			DB_WORDPRESS_NAME=${DB_WORDPRESS_NAME} \
			DB_WORDPRESS_USERNAME=${DB_WORDPRESS_USERNAME} \
			DB_WORDPRESS_USERPASS=${DB_WORDPRESS_USERPASS} \
			DOMAIN_NAME=${DOMAIN_NAME} \
			WP_TITLE=${WP_TITLE} \
			WP_ADMIN_NAME=${WP_ADMIN_NAME} \
			WP_ADMIN_PASS=${WP_ADMIN_PASS} \
			WP_ADMIN_EMAIL=${WP_ADMIN_EMAIL} \
			WP_USER_NAME=${WP_USER_NAME} \
			WP_USER_PASS=${WP_USER_PASS} \
			WP_USER_EMAIL=${WP_USER_EMAIL}

ENTRYPOINT	["sh", "php_launcher.sh"]

# EXPOSE 9000
