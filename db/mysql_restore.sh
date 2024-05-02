#!/usr/bin/bash
set -x

mysql_admin_pass="xxx"

for db in `cat db.list`; do

	mysql -u root -p$mysql_admin_pass $db < ./mysql/$db.sql
done
