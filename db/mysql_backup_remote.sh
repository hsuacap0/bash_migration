#!/bin/bash
#RUN FROM SOURCE SERVER (PUSH), NEED TO EXTRACT USING GUNZIP IN DESTINATION SERVER
#set -x
DEST_IP="XXX" # Destination Server
DEST_LOGIN="XXX" # Username
DEST_PATH="xxx" # partition
KEY="xxx"
DB_PASS="xxx"

USER="root"

databases=` mysql -u$USER -p$DB_PASS-e "SHOW DATABASES;" | tr -d "| " |grep -v Database`

for db in $databases;

do

echo $db
mysqldump --opt --set-gtid-purged=OFF --skip-lock-tables -u$USER -p$DB_PASS --databases $db | gzip -f | ssh -i $KEY $DEST_LOGIN@$DEST_PRIVATE_IP "cat > /$DEST_PATH/mysql/$db.sql.gz"

done
