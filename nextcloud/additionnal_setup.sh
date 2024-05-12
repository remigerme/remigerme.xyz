#!/bin/bash

echo Starting nextcloud instance
docker compose -f /home/raimmy/remigerme.xyz/nextcloud/docker-compose.nextcloud.yml up -d --build
docker exec -u www-data -it nextcloud php occ config:system:set overwriteprotocol --value='https'
docker exec -u www-data -it nextcloud php occ config:system:set trusted_proxies 0 --value=172.0.0.0/16
docker exec -u www-data -it nextcloud php occ config:system:set default_phone_region --value='FR'
docker exec -u www-data -it nextcloud php occ config:system:set maintenance_window_start --type=integer --value=1
docker compose -f /home/raimmy/remigerme.xyz/nextcloud/docker-compose.nextcloud.yml down
echo Shutting down nextcloud instance
