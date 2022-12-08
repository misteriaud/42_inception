#!/bin/sh
openssl req -newkey rsa:2048 -nodes \
	-keyout mriaud.42.fr.key -x509 \
	-days 1\
	-out mriaud.42.fr.crt \
	-subj "/C=FR/ST=Ile-de-France/L=Paris/O=Ecole 42/OU=IT/CN=mriaud.42.fr"
