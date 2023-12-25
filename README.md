## Installation
Upload `.env` file to the `nextcloud` folder.

Create network `web` :
```
sudo docker network create web
```

Set correct permissions to `acme.json` :
```
chmod 600 letsencrypt/acme.json
```

### Prod disk
In `/etc/fstab` add :
```
UUID=here_uuid_prod /mnt/prod ext4 defaults 0 0
```

```
sudo mkdir -p /mnt/prod
sudo mount -a
sudo mkdir -p /mnt/prod/data
sudo chown -R www-data:sudo /mnt/prod/data
sudo chmod 750 /mnt/prod/data
``` 

### Backup disk
```
sudo mkdir -p /mnt/backup
TODO
```

## Run in production
Run traefik :
```
sudo docker compose -f docker-compose.traefik.yml up -d --build
```

Run nextcloud :
```
sudo docker compose -f docker-compose.nextcloud.yml up -d --build
```

## Backups
