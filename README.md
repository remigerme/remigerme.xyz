# remigerme.xyz

## Installation
Upload `.env` file to the `nextcloud` folder. Then :
```
chmod +x setup.sh && sudo ./setup.sh
```
Don't forget to edit emails in `traefik.yml` and crontab.

## Run in production
Run traefik :
```
sudo docker compose -f docker-compose.traefik.yml up -d --build
```

Run nextcloud :
```
sudo docker compose -f docker-compose.nextcloud.yml up -d --build
```

## Backup
