WORDPRESS = ${HOME}/data/wordpress_static/wordpress
DATA_DIR = $(addprefix ${HOME}/data/, wordpress_static wordpress_db)
# DATA_DIR = $(HOME)/data

all: $(DATA_DIR) $(WORDPRESS)
	docker compose -f ./srcs/docker-compose.yml up --build

$(DATA_DIR):
	mkdir -p $@

$(WORDPRESS):
	wget http://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz
	tar -xzf /tmp/latest.tar.gz -C $(HOME)/data/wordpress_static

fclean:
	rm -rf $(DATA_DIR)

.PHONY: set_data_dir
