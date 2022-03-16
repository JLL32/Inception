FROM debian:buster

RUN apt update
RUN apt install mariadb-server -y
RUN apt clean

RUN service mysql start && \
  mysql -e "CREATE DATABASE wp;"

COPY ./startup.sh ./

EXPOSE 3306

CMD ["sh", "startup.sh"]
