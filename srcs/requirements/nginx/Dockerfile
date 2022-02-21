# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clbouche <clbouche@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/21 14:28:41 by clbouche          #+#    #+#              #
#    Updated: 2022/02/21 16:23:08 by clbouche         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#IMAGE
FROM debian:buster

# update the software repository
RUN apt-get update

#install EngineX
RUN apt-get -y install nginx

COPY ./conf /etc/nginx/nginx.conf

CMD bash init.sh \ [ "nginx", "-g", "daemon off;" ]