#!/bin/bash
if [ ! -f "/var/lib/mysql/${DB_NAME}" ]; then
	mysql_install_db
  service mysql start 
  mysql -e "CREATE DATABASE ${DB_NAME};"
  mysql -e "CREATE USER '${DB_USER}'@'%' identified by '${DB_PASS}';"
  mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'%' IDENTIFIED BY '${DB_PASS}'"
  mysql -u root --skip-password ${DB_NAME} < wordpress.sql

  mysql -e "ALTER USER '${ROOT_USER}'@'localhost' IDENTIFIED BY '${ROOT_PASS}';"
  mysql -u$ROOT_USER -p$ROOT_PASS -e "FLUSH PRIVILEGES;"

  mysqladmin -u $ROOT_USER -p$ROOT_PASS shutdown
fi
mysqld_safe
