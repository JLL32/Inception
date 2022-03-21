FROM debian:buster

RUN apt update
RUN apt install wget -y
RUN apt install php  -y
RUN apt install php-mysql -y
RUN apt install php-mbstring -y
RUN apt install php-fpm -y
RUN apt clean

WORKDIR /var/www/html

RUN wget http://wordpress.org/latest.tar.gz
RUN tar xfz latest.tar.gz
RUN rm -f latest.tar.gz
RUN rm index.html

COPY ./wp-config.php ./wordpress/

RUN echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i 's/user = nobody/user = root/g'  /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i 's/group = nobody/group = root/g'  /etc/php/7.3/fpm/pool.d/www.conf

RUN service php7.3-fpm start

EXPOSE 9000

CMD ["php-fpm7.3", "--nodaemonize", "--allow-to-run-as-root"]
