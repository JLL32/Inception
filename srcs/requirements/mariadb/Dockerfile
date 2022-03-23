FROM debian:buster

RUN apt update
RUN apt install mariadb-server -y
RUN apt clean

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

COPY ./wordpress.sql ./
COPY ./setup.sh ./
RUN sh setup.sh

EXPOSE 3306

CMD ["mysqld_safe"]
