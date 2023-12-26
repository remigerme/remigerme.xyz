#!/bin/bash

export $(xargs < .env)

echo Entering maintenance mode
docker exec -u www-data nextcloud php /var/www/html/occ maintenance:mode --on

mount UUID=$UUID_BACKUP /mnt/backup
echo Disk mounted

echo Data folder backup : starting
rsync -Aaxu /mnt/prod/data/ /mnt/backup/data/
echo Data folder backup : done

echo Dumping db : starting
docker exec nextcloud-mariadb sh -c '(mysqldump --single-transaction -h mariadb -u "'"$MYSQL_USER"'" -p"'"$MYSQL_PASSWORD"'" "'"$MYSQL_DB"'" > /backup/nextcloud_`date +"%Y%m%d"`.bak)'
echo Dumping db : done

umount /mnt/backup
echo Disk unmounted, backup done

docker exec -u www-data nextcloud php /var/www/html/occ maintenance:mode --off
echo Maintenance mode over