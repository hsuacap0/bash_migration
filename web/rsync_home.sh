#!/bin/bash
##RUN THIS FROM SOURCE SERVER (PULLING)
#set -x
source_server="xxx"
ssh_key="xxx"

for user in `cat users.list`; do

  echo $user
  rsync --verbose --owner --group --progress \
  --stats --recursive --times --perms --links \
  --exclude "*.tar.gz" --delete --rsh="/usr/bin/ssh -i " root@$source_server:/home/$user/ /home/$user/

done
