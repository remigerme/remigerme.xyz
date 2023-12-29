# remigerme.xyz

## Installation
Upload `.env` file to the `nextcloud` folder. Then :
```
chmod +x setup.sh && sudo ./setup.sh
```

The first time you run the container (when the volume is created), you need to run :
```
sudo docker exec -u www-data -it nextcloud php occ config:system:set overwriteprotocol --value='https'
```
Else, you won't be able to connect via nextcloud clients (desktop or mobile).

Then you might run :
```
sudo docker exec -u www-data -it nextcloud php occ config:system:set default_phone_region --value='FR'
```

## Run in production
Run everything :
```
sudo ./start.sh
```

Or, if you're brave enough, you can run services one by one.

Run traefik :
```
sudo docker compose -f docker-compose.traefik.yml up -d --build
```

Run home static website :
```
sudo docker compose -f home/docker-compose.home.yml up -d --build
```

Run nextcloud :
```
sudo docker compose -f nextcloud/docker-compose.nextcloud.yml up -d --build
```

## Backup
A daily backup is done at 2AM.

Disks are checked every 15min. Disable cron task when doing maintenance.

From time to time, manually run :
```
sudo rsync -Aau --delete /mnt/prod/data/ /mnt/backup/data/
```
The delete file allows you to remove junk files from previous backups which don't exist anymore. Do not cron it as it might erase backup if prod disk fails.