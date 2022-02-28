# image
FROM debian:buster

# update the software repository
RUN apt-get update && \
	apt-get -y install mariadb-server mariadb-client && \
	mkdir -p /var/run/mysqld; mkdir -p /run/mysqld && \
	chown -R mysql:root /run/mysqld ; chown -R mysql:root /var/run/mysqld

COPY ./conf/script.sh /root/conf/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 

CMD ["bash", "/root/conf/script.sh"]