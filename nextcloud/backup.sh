echo Entering maintenance mode
sudo docker exec -u www-data nextcloud php /var/www/html/occ maintenance:mode --on

sudo mount UUID=uuid_here_backup /mnt/backup
echo Disk mounted

echo Starting data folder backup
sudo rsync -Aaxu /mnt/prod/data/ /mnt/backup/data/
echo Data folder backup done

sudo umount /mnt/backup
echo Disk unmounted, backup done

sudo docker exec -u www-data nextcloud php /var/www/html/occ maintenance:mode --off
echo Maintenance mode over