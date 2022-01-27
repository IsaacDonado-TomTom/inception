# all: volume_directories
# 	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d

# clean:
# 	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

# fclean: clean
# 	@sudo rm -rf /home/$(USER)/data/mariadb
# 	@sudo rm -rf /home/$(USER)/data/wordpress
# 	@docker system prune -a

# re: fclean all

# volume_directories:
# 	@mkdir -pv /home/$(USER)/data/mariadb
# 	@mkdir -pv /home/$(USER)/data/wordpress

# .PHONY: all fclean clean volume_directories

NAME = inception

all: fclean reload

clean:
	@ sudo sed -i '/idonado.42.fr/d' /etc/hosts
	@ docker-compose -f srcs/docker-compose.yml --env-file ./srcs/.env down

fclean: clean
	@ docker system prune -a
	@ sudo rm -rf /home/$(USER)/data/mariadb
	@ sudo rm -rf /home/$(USER)/data/wordpress

reload:
	@ mkdir -pv /home/$(USER)/data/mariadb
	@ mkdir -pv /home/$(USER)/data/wordpress
	@ docker-compose -f srcs/docker-compose.yml --env-file ./srcs/.env up --d
	@ echo "127.0.0.1 idonado.42.fr" >> /etc/hosts

.PHONY: clean fclean reload all name
