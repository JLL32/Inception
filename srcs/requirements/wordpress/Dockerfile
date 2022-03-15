FROM debian:buster

RUN apt update
RUN apt install wget -y
RUN apt install php  -y
RUN apt install php-mysql -y
RUN apt install php-mbstring -y
RUN apt install php-fpm -y
RUN apt install ufw -y
RUN apt clean

WORKDIR /var/www/html

RUN wget http://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz
RUN mv wordpress/* ./
RUN rm -f latest.tar.gz

RUN rm index.html

COPY . .

# RUN systemctl disable --now apache2
# RUN ufw allow php-fpm

EXPOSE 9000

CMD [ "php-fpm7.3", "--nodaemonize"]
