FROM debian:buster

RUN apt update
RUN apt install mariadb-server -y
RUN apt clean

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*


RUN service mysql start && \
  mysql -e "CREATE DATABASE wp;"

COPY ./startup.sh ./

EXPOSE 3306

CMD ["sh", "startup.sh"]
