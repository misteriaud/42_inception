FROM	alpine:latest
COPY	official_nginx_signature	/tmp
RUN		apk add --no-cache openssl curl ca-certificates \
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
# RUN		echo "ssl_protocols TLSv1.2 TLSv1.3;" >> /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;", "-g", "ssl_protocols TLSv1.2 TLSv1.3;"]
