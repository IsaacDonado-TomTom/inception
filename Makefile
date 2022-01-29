NAME = inception

all: reload

clean:
	@ docker-compose -f srcs/docker-compose.yml --env-file ./srcs/.env down

fclean: clean
	@ docker system prune -a
	@ sudo rm -rf /home/$(USER)/data

reload:
	@ mkdir -pv /home/$(USER)/data/mariadb
	@ mkdir -pv /home/$(USER)/data/wordpress
	@ docker-compose -f srcs/docker-compose.yml --env-file ./srcs/.env up --d

hosts: undo-hosts
	@ sudo sh ./srcs/requirements/tools/domain.sh

undo-hosts:
	@ sudo sed -i '/idonado.42.fr/d' /etc/hosts

.PHONY: clean fclean reload all inception hosts undo-hosts
