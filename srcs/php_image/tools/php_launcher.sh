#!/bin/sh
set -e

echo "php_launcher running";
ls /usr/local/bin/wp;

if [ ! -d "/usr/share/wordpress" ]; then
	echo "wordpress missing, downloading wordpress";
	wp core download --path=/usr/share/wordpress;
fi

	# && wp db create --path='/usr/share/wordpress' \
if [ ! -f "/usr/share/wordpress/wp-config.php" ]; then
	echo "wordpress config file missing, setting up config file";
	wp config create	--allow-root \
						--dbname=$DB_WORDPRESS_NAME \
						--dbuser=$DB_WORDPRESS_USERNAME \
						--dbpass=$DB_WORDPRESS_USERPASS \
						--dbhost=mariadb:3306 \
						--path='/usr/share/wordpress' \
	&& echo "wp core install" \
	&& wp core install	--url=$DOMAIN_NAME \
						--title="$WP_TITLE" \
						--admin_user=$WP_ADMIN_NAME \
						--admin_password=$WP_ADMIN_PASS \
						--admin_email=$WP_ADMIN_EMAIL \
						--path='/usr/share/wordpress' \
	&& echo "wp user create" \
	&& wp user create	$WP_USER_NAME $WP_USER_EMAIL \
						--user_pass=$WP_USER_PASS \
						--role=author \
						--path='/usr/share/wordpress';
else
	echo "already configured";
fi

exec php-fpm8;
