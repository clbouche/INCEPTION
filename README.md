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
  	On va créer un Wordpress, un CMS écrit en PHP et qui utilise mySQL comme base de données. 
	MariaDB étant un fork de MySQL, on l'utilisera donc ici. Il nous faudra également un serveur Web, ici Nginx. 
	

	
### Notions de bases :  

Pour faire ce petit setup, je vais détailler 3 notions qui vont nous servir pour la suite: 
	- une image docker = modèle en lecture seule qui contient toutes les instructions pour créer un conteneur qui fonctionnera avec Docker.
	- un volume docker = permet de faire communiquer les conteneurs partageant le même volume. Les données de chacun conteneur vont perdurer et les fichiers seront partagés. 
	- réseau = permet la communication entre les conteneurs. Il sera précisé dans le docker-compose.yml pour pouvoir le spécifié ensuite dans les conteneurs concernés. 
	
### Nos services : 

#### Dockerfile 
Pour chacun de nos services, on aura besoin d'un Dockerfile. Normalement, on a vu ça avec ft_server. Mais voici les quelques règles de bases à définir dans un Dockerfile pour chaque service : 
* définition de la distribution (ici, debian:buster). 
* installation et MAJ des services.   
* configuration, on va récupérer les fichiers de configuration par défaut et les adapter à nos besoins.  
* exposition des ports ( 3306 pour mariadb, 443 pour nginx, et 9000 pour wordpress ). 
* exécution   

---

<h1 align=center> 
<img width="504" alt="Capture d’écran 2022-03-07 à 15 07 55" src="https://user-images.githubusercontent.com/57404773/157049642-99d4c639-53dc-430f-99be-2883d384ede9.png">  </h1>   

 
1. NGINX  
  
On va aller chercher le fichier de configuration de base (nginx.conf) puis le copier dans nos fichiers de configuration pour l'adapter à nos besoins : 
	- On sait qu'on doit écouter sur le port 443 donc on configure notre fichier pour écouter sur le port 443. 
	- On devra donc spécifié un protocole SSL et configurer les clés. 
	
2. MARIADB

	On aura besoin d'une jolie MariaDB pour faire fonctionner notre Wordpress. Oui, car Wordpress a besoin d'un gestionnaire de base de données. On commence par faire comme avec Nginx. On va chercher le fichier de configuration de base de MariaDB (50-server.cnf), on le copie dans nos fichiers et on adapte le tout à nos besoins : 
	- Ici, on a besoin que MariaDB communique avec Wordpress alors on modifie "bind-adress" (127.0.0.1 devient 0.0.0.0)
	- et bien je crois que c'est tout pour la config.  
	
	On poursuit en remplissant notre base de données grâce à un petit script. Les spécificités de ce script : 
	- % 
	- les guillemets 
	- les droits
	- le minimum pour faire fonctionne la DB 

	
3. WORDPRESS
On est presque au bouuuuut ! C'est l'étape finale pour obtenir notre page web 🎉 

	



#### Commandes

  
---
## Notes

---
## Ressources
- https://blog.ippon.fr/2014/10/20/docker-pour-les-nu-pour-les-debutants/  → pour se remettre dans le bain après un ft_server qui
date d'il y a 1 an. 
- https://www.digitalocean.com/community/tutorials/how-to-set-up-laravel-nginx-and-mysql-with-docker-compose → un super tuto qui reprends les grandes lignes du projet (installation nginx, variables d'environnement, le fichier docker-compose.yml, le volume, etc..) 
- https://www.digitalocean.com/community/tutorials/understanding-and-implementing-fastcgi-proxying-in-nginx → pour faire la partie PHP-FPM 
- https://www.adsysteme.com/lacces-a-distance-aux-bases-de-donnees-mysql-mariadb/ → accès à distance de MariaDB
---
### 🎉 Final Grade 🎉 
Et bien je n'ai pas encore validé le projet mais je vous tiens au courant.

--- 
🍄 ENJOY 🍄
