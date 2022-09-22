#!/bin/bash
if [ ! -f "/var/lib/mysql/ibdata1" ]; then
	mysql_install_db
  service mysql start 
  mysql -u root --skip-password ${DB_NAME} < wordpress.sql
  mysql -e "CREATE DATABASE ${DB_NAME};"
  mysql -e "CREATE USER '${DB_USER}'@'%' identified by '${DB_PASS}';"
  mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'%' IDENTIFIED BY '${DB_PASS}'"
  service mysql stop
fi
mysqld_safe
