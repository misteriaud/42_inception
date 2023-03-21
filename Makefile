DATA_DIR = $(addprefix ${HOME}/data/, wordpress_static wordpress_db)
# DATA_DIR = $(HOME)/data
DOCKER_CMD = docker compose -f ./srcs/docker-compose.yml --env-file $(HOME)/.env

all: up

up: $(DATA_DIR)
	$(DOCKER_CMD) up --build

down:
	$(DOCKER_CMD) down

$(DATA_DIR):
	mkdir -p $@

clean:
	- docker system prune --all
	- docker rm $(shell docker ps -qa)
	- docker rmi -f $(shell docker images -qa)
	- docker volume rm $(shell docker volume ls -q)
	- docker network rm $(shell docker network ls -q)

fclean: down clean
	sudo rm -rf $(DATA_DIR)

re: fclean up

.PHONY: up down clean_docker fclean re
