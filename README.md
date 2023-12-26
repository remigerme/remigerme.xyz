# remigerme.xyz

## Installation
Upload `.env` file to the `nextcloud` folder. Then :
```
chmod +x setup.sh && source setup.sh
```

### Backup disk
```
TODO MYSQL
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
