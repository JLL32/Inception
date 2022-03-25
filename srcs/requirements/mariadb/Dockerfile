FROM debian:buster

RUN apt update
RUN apt install mariadb-server -y
RUN apt clean

RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./wordpress.sql ./
COPY ./setup.sh ./

EXPOSE 3306

CMD ["sh", "setup.sh"]
