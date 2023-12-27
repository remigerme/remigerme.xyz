docker compose -f docker-compose.traefik.yml up -d --build
docker compose -f home/docker-compose.home.yml up -d --build
docker compose -f nextcloud/docker-compose.nextcloud.yml up -d --build