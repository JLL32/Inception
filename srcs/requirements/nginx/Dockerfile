FROM debian:buster

RUN apt update && apt install nginx -y && apt install openssl -y
RUN rm /etc/nginx/nginx.conf
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out \
  /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Benguerir/L=Benguerir/O=mine/CN=jll32"

COPY nginx.conf /etc/nginx

CMD [ "nginx", "-g", "daemon off;" ]
