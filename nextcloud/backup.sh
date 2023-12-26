#!/bin/bash

export $(xargs < /home/raimmy/remigerme.xyz/nextcloud/.env)

mylog () {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1"
}

mylog "Entering maintenance mode"
docker exec -u www-data nextcloud php /var/www/html/occ maintenance:mode --on

mylog "Data folder backup : starting"
rsync -Aau /mnt/prod/data/ /mnt/backup/data/
mylog "Data folder backup : done"

mylog "Dumping db : starting"
docker exec nextcloud-mariadb sh -c '(mysqldump --single-transaction -h mariadb -u "'"$MYSQL_USER"'" -p"'"$MYSQL_PASSWORD"'" "'"$MYSQL_DB"'" > /backup/nextcloud_`date +"%Y%m%d"`.bak)'
mylog "Dumping db : done"

docker exec -u www-data nextcloud php /var/www/html/occ maintenance:mode --off
mylog "Maintenance mode over"