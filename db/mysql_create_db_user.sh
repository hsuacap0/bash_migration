#!/usr/bin/bash
set -x
mysql_admin="root"
mysql_admin_pass="xxx"
mysql_user_pass="xxx"

for db in `cat db.list`; do

mysql -u$mysql_admin -p$mysql_admin_pass -e "create database $db;"
mysql -u$mysql_admin -p$mysql_admin_pass -e "CREATE USER '$db'@'localhost' IDENTIFIED BY '$mysql_user_pass';"
mysql -u$mysql_admin -p$mysql_admin_pass -e "GRANT ALL ON $db.* TO '$db'@'localhost';"
mysql -u$mysql_admin -p$mysql_admin_pass -e "flush privileges;"
done
