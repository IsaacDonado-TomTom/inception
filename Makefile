NAME = inception

all: fclean reload

clean:
	@ sudo sed -i '/idonado.42.fr/d' /etc/hosts
	@ sudo docker-compose -f srcs/docker-compose.yml --env-file ./srcs/.env down

fclean: clean
	@ sudo docker system prune -a
	@ sudo rm -rf /home/$(USER)/data/mariadb
	@ sudo rm -rf /home/$(USER)/data/wordpress
	@ sudo rm -rf /home/$(USER)/data

reload:
	@ mkdir -pv /home/$(USER)/data/mariadb
	@ mkdir -pv /home/$(USER)/data/wordpress
	@ sudo docker-compose -f srcs/docker-compose.yml --env-file ./srcs/.env up --d
	@ sudo sh ./srcs/requirements/tools/domain.sh

.PHONY: clean fclean reload all inception
