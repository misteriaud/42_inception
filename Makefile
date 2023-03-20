DATA_DIR = $(addprefix ${HOME}/data/, wordpress_static wordpress_db)
# DATA_DIR = $(HOME)/data

all: up

up: $(DATA_DIR) $(WORDPRESS)
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

$(DATA_DIR):
	mkdir -p $@

fclean: down
	rm -rf $(DATA_DIR)

.PHONY: up down
