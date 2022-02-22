#image
FROM debian:buster

#install PHP
RUN apt-get update && \
	apt-get -y install php7.3-fpm php7.3-common php7.3-mysql && \
	mkdir -p /run/php/

COPY ./www.conf	./etc/php/7.3/fpm/pool.d/www.conf

RUN ln -sf /dev/stdout /var/log/php7.3-fpm.access.log \
    && ln -sf /dev/stderr /var/log/php7.3-fpm.log

CMD php-fpm7.3 -F -R