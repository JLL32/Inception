FROM debian:buster

RUN apt-get update


# Installing core programs
RUN apt -y install nginx
RUN apt -y install curl
RUN apt -y install wget
RUN apt -y install ufw

# adding our nginx configuration file
COPY ./mysite.conf /etc/nginx/sites-available/
# enabling the server by creating a symbolic link at sites-enabled/
RUN ln -s /etc/nginx/sites-available/mysite.conf /etc/nginx/sites-enabled/
# unlinking the default configuration
RUN unlink /etc/nginx/sites-enabled/default

### SSL
# installing certutil which will be used by mkcert to create our SSL certificate
RUN apt-get -y install libnss3-tools
# downlaoding the mkcert binary
RUN curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest | grep browser_download_url  | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -
# Copying mkcert to the binaries folder
RUN mv mkcert-v*-linux-amd64 mkcert
RUN chmod a+x mkcert
RUN mv mkcert /usr/local/bin/


# creating local CA with mkcert, which will create the SSL certificate
RUN mkcert -install
# generating the SSL_certificate and the SSL_certificate_key for the following
# domain names
RUN mkcert my-ssl-cert localhost 127.0.0.1
RUN mv my-ssl-cert+2.pem /etc/ssl/my-ssl-cert+2.pem
RUN mv my-ssl-cert+2-key.pem /etc/ssl/my-ssl-cert+2-key.pem

RUN ufw allow 443

### DOCUMENTING EXPOSED PORTS
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
