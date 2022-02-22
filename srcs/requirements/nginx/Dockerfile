# image
FROM debian:buster

# update the software repository
RUN apt-get update && \
	apt-get -y install nginx openssl

#install EngineX
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt \
	-subj "/CN=FR/SN=Paris/L=17ieme/O=42 School/OU=clbouche/CN=clbouche@student.42.fr"

# copy the new config
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# stay in the foreground
CMD [ "nginx", "-g", "daemon off;" ]