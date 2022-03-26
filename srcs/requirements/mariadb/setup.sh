#!/bin/bash
service mysql start 

mysql -e "CREATE DATABASE ${DB_NAME};"
mysql -e "CREATE USER '${DB_USER}'@'%' identified by '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'%' IDENTIFIED BY '${DB_PASS}'"

mysql -u root --skip-password ${DB_NAME} < wordpress.sql
service mysql stop
