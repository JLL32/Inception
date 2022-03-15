FROM debian:buster

RUN apt install php 
RUN apt install php-mysql
RUN apt php-mbstring
RUN apt install php-fpm


WORKDIR /var/www/html

RUN wget http://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz
RUN mv wordpress/* ./
RUN rm -f latest.tar.gz

RUN rm index.html

COPY . .

RUN ufw allow php-fpm

CMD [ "php-fpm" ]
