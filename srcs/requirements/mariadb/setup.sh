#!/bin/bash
service mysql start 
echo "CREATE DATABASE wpdb;"\
	 "GRANT ALL PRIVILEGES ON wpdb.* TO 'root'@'localhost' WITH GRANT OPTION;"\
	 "update mysql.user set plugin='mysql_native_password' where user='root';"\
	 "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mysql -e "CREATE USER 'wpuser'@'%' identified by '12345';"
mysql -e "GRANT ALL PRIVILEGES ON wpdb.* TO wpuser@'%' IDENTIFIED BY '12345'"
mysql -e "FLUSH PRIVILEGES;"

mysql -u root --skip-password wpdb < wordpress.sql
