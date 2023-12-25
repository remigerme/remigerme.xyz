Create network `web` :
```
sudo docker network create web
```

Run traefik :
```
sudo docker compose -f docker-compose.traefik.yml up -d --build
```

Run nextcloud :
```
sudo docker compose -f docker-compose.traefik.yml up -d --build
```

TODO : Let's Encrypt SSL certificate