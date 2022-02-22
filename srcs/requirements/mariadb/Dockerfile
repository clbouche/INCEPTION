# image
FROM debian:buster

# update the software repository
RUN apt-get update && \
	apt-get -y install mariadb-server mariadb-client && \
	mkdir -p /var/run/mysqld; mkdir -p /run/mysqld && \
	chown -R mysql:root /var/run/mysqld

COPY script.sh /root/script.sh

CMD ["bash", "/root/script.sh"]