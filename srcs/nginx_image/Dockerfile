FROM		alpine:3.17.2
ARG			DOMAIN_NAME

COPY		tools/official_nginx_signature	/tmp
RUN			apk add --no-cache --virtual install_deps openssl curl ca-certificates \
			&& printf "%s%s%s%s\n" \
				"@nginx " \
				"http://nginx.org/packages/alpine/v" \
				`egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
				"/main" \
				| tee -a /etc/apk/repositories \
			&& curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub \
			&& openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout > /tmp/nginx_signature_out \
			&& diff /tmp/official_nginx_signature /tmp/nginx_signature_out \
			&& rm -f /tmp/nginx_signature_out && rm -f /tmp/nginx_signature_out \
			&& mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/ \
			&& apk add nginx@nginx
RUN			openssl req	-newkey rsa:2048 -nodes \
						-keyout /etc/nginx/${DOMAIN_NAME}.key -x509 \
						-days 1\
						-out /etc/nginx/${DOMAIN_NAME}.crt \
						-subj "/C=FR/ST=Ile-de-France/L=Paris/O=Ecole 42/OU=IT/CN=${DOMAIN_NAME}"
RUN			curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s`-`uname -m` -o envsubst \
			&& chmod +x envsubst
RUN			apk del install_deps
COPY		conf/* .
RUN			./envsubst -no-unset < nginx.conf.template > /etc/nginx/nginx.conf

ENTRYPOINT	["nginx"]

EXPOSE	443
