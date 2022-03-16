service php7.3-fpm start
service php7.3-fpm stop
ufw allow 9000
php-fpm7.3 --nodaemonize --allow-to-run-as-root
