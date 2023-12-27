# remigerme.xyz

## Installation
Upload `.env` file to the `nextcloud` folder. Then :
```
chmod +x setup.sh && sudo ./setup.sh
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
