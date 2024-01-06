#!/bin/bash

chmod +x start.sh
chmod +x shutdown.sh

docker network inspect web >/dev/null 2>&1 || docker network create web
chmod 600 letsencrypt/acme.json

chmod +x nextcloud/setup.sh
source nextcloud/setup.sh

chmod +x yourls/setup.sh
source yourls/setup.sh