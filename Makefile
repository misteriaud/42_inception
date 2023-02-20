WORDPRESS = $(HOME)/data/wordpress_static/wordpress
DATA_DIR = $(addprefix ${HOME}/data/, wordpress_static wordpress_db)

all: $(DATA_DIR) $(WORDPRESS)
	docker compose -f ./srcs/docker-compose.yml up --build

$(DATA_DIR):
	mkdir -p $@

$(WORDPRESS): $(DATA_DIR)
	wget http://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz
	tar -xzf /tmp/latest.tar.gz -C $(HOME)/data/wordpress_static
