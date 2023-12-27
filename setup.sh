#!/bin/bash

chmod +x start.sh

docker network inspect web >/dev/null 2>&1 || docker network create web
chmod 600 letsencrypt/acme.json

chmod +x nextcloud/setup.sh
source nextcloud/setup.sh