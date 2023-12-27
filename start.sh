docker compose -f docker-compose.traefik.yml up -d --build
echo Started traefik
docker compose -f home/docker-compose.home.yml up -d --build
echo Started home static website
docker compose -f nextcloud/docker-compose.nextcloud.yml up -d --build
echo Started nextcloud