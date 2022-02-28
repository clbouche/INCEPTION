#image
FROM debian:buster

#install PHP
RUN apt-get update && \ 
	mkdir -p /var/www/html && \
	apt-get -y install php7.3-fpm php7.3-common php7.3-mysql curl mariadb-client && \
	mkdir -p /run/php/

#install wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf	/etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/script.sh	.

RUN ln -sf /dev/stdout /var/log/php7.3-fpm.access.log \
    && ln -sf /dev/stderr /var/log/php7.3-fpm.log

CMD bash script.sh