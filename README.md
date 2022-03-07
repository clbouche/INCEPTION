<h1 align=center> INCEPTION - 42 </h1>   
  
  
  
## Sujet   
  
  
	→ Le sujet nous dit : "Ce projet vise à élargir vos connaissances en matière d'administration système en
	utilisant Docker. Vous allez virtualiser plusieurs images Docker, en les créant dans votre nouvelle machine
	virtuelle personnelle. " 
	
Et cette "élargissement" de mes connaissances à Docker à été ENORMEMENT faciliter par le talentueux [Arthur](https://github.com/arthur-trt?tab=repositories) ! 
(il adore Docker (oui, il est bizarre) mais en tout cas il m'a bien servi).  
Allez, c'est parti !

---
## Notion de bases : 
1. DOCKER :   


 	On va partir sur une définition plutôt imagée : tu vois un conteneur dans la vraie vie pour transporter des trucs ?
 Ben tout pareil, mais niveau logiciel. 
 
2. DOCKER VS VM :  


	Le grand débat se joue surtout là (apparemment, c'est pas moi qui le dis, comme t'as compris je suis pas une experte). 
Mais globalement, on trouve rapidement un grand avantage à l'utilisation de Docker plutôt qu'à une VM. 
	- Contrairement à la VM, Docker n'a pas besoin de simulation d'OS donc hop, on évite d'utiliser des ressources inutilement. 
	- Ce qui suit naturellement la première information : lancement plus rapide. 
	- Un autre bel avantage : docker permet un déploiement directement d'un environnement de dévéloppement à un environnement 
		de production. 
	- Ce qui suit naturellement l'info ci dessus : moins de surprise au déploiement. 
Un bel exemple de l'utilité de Docker : 3 personnes souhaitant créer une même appli mais utilisant 3 OS différents. 
Solution : Docker. On construit et distribue un ensemble d'applications pré-configurés pour le projet et hop tout le monde 
bosse avec le même environnement. 


3. DOCKER COMPOSE : 


	L'outil magique qui permet de décrire et gérer plusieurs conteneurs pour créer un ensembles de services inter-connectés. 
On peut imaginer que l'on veut setup 3 conteneurs : nginx, wordpress et mariadb. (oui, je vous donne le sujet d'Inception,
bien vu sherlock) Sauf qu'on ne veut pas lancer ces services individuellement mais les rendre inter-connectés. C'est là que
docker-compose rendre en jeu! 
Concrètement, on défini un docker-compose.yml qui fera appel au Dockerfile de chaque service et qui fera en sorte de les
connecter tous ensemble.



---
## Plan du projet
  	On va créer un site Wordpress, un CMS écrit en PHP et qui utilise mySQL comme base de données. MariaDB étant un fork de MySQL, on l'utilisera donc ici. Il nous faudra également un serveur Web, ici Nginx. 
  
#### WORDPRESS

	
#### MARIADB

	
#### NGINX  





  
---
## Notes

---
## Ressources
- https://blog.ippon.fr/2014/10/20/docker-pour-les-nu-pour-les-debutants/  → pour se remettre dans le bain après un ft_server qui
date d'il y a 1 an. 
- 
---
### 🎉 Final Grade 🎉 
Et bien je n'ai pas encore validé le projet mais je vous tiens au courant.

--- 
🍄 ENJOY 🍄
