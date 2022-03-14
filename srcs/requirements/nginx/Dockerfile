FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get clean

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
