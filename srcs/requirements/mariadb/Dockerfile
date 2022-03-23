FROM debian:buster

RUN apt update
RUN apt install mariadb-server -y
RUN apt clean

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*


RUN service mysql start 

# Setup dabase for wordpress
RUN echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
RUN echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
RUN echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
RUN echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
RUN mysql -u root --skip-password wordpress < wordpress.sql

COPY ./startup.sh ./

EXPOSE 3306

CMD [mysqld_safe]
