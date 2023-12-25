Create network `web` :
```
sudo docker network create web
```
Run traefik :
```
chmod 600 letsencrypt/acme.json
sudo docker compose -f docker-compose.traefik.yml up -d --build
```

Run nextcloud :
```
sudo docker compose -f docker-compose.nextcloud.yml up -d --build
```

TODO : certbot SSL certificate