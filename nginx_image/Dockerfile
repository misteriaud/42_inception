FROM		alpine:latest
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
RUN			apk del install_deps
COPY		conf/* /etc/nginx/

ENTRYPOINT	["nginx"]
# ENTRYPOINT	["nginx", "-g", "daemon off;"]

EXPOSE	443
