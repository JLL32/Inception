FROM debian:buster

RUN apt-get update


RUN apt -y install nginx
# adding our nginx configuration file
COPY srcs/mysite.conf /etc/nginx/sites-available/
# enabling the server by creating a symbolic link at sites-enabled/
RUN ln -s /etc/nginx/sites-available/mysite.conf /etc/nginx/sites-enabled/
# unlinking the default configuration
RUN unlink /etc/nginx/sites-enabled/default

### SSL
# installing certutil which will be used by mkcert to create our SSL certificate
RUN apt-get -y install libnss3-tools
# copying the mkcert binary
COPY srcs/mkcert-v1.4.1-linux-amd64 /usr/local/bin/mkcert
RUN chmod +x /usr/local/bin/mkcert
# creating local CA with mkcert, which will create the SSL certificate
RUN mkcert -install
# generating the SSL_certificate and the SSL_certificate_key for the following
# domain names
RUN mkcert my-ssl-cert localhost 127.0.0.1
RUN mv my-ssl-cert+2.pem /etc/ssl/my-ssl-cert+2.pem
RUN mv my-ssl-cert+2-key.pem /etc/ssl/my-ssl-cert+2-key.pem

### DOCUMENTING EXPOSED PORTS
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
