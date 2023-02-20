FROM		alpine:3.16.3
RUN			apk add php php-fpm php-mysqli
COPY		conf/php-fpm.conf /etc/php8/php-fpm.conf

ENTRYPOINT	["php-fpm8"]

# EXPOSE 9000
