NAME = inception

all: 
	@ mkdir -p /home/clbouche/data/wp_vol/
	@ mkdir -p /home/clbouche/data/db_vol/
	@ docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	@ docker-compose -f ./srcs/docker-compose.yml up -d
	
down:
	@ docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@ cd $(SRCS) && docker container prune; 

fclean: clean
	@ sudo rm -rf /home/clbouche/data/wp_vol
	@ sudo rm -rf /home/clbouche/data/db_vol
	@ docker system prune -a

re: fclean all

.PHONY: up down clean fclean re all