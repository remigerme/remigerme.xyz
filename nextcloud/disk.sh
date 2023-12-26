#!/bin/bash

export $(xargs < /home/raimmy/remigerme.xyz/nextcloud/disk.env)

mylog () {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] $1"
}

mylog "Checking prod disk"
if ! lsblk | grep -q "/mnt/prod"; then
    mylog "Prod disk not found, shutting down"
    docker compose -f /home/raimmy/remigerme.xyz/nextcloud/docker-compose.nextcloud.yml down
    umount /mnt/backup
    exit 1
fi
mylog "Prod disk fine"

mylog "Checking backup disk"
if ! lsblk | grep -q "/mnt/backup"; then
    mylog "Backpup disk not found, shutting down"
    docker compose -f /home/raimmy/remigerme.xyz/nextcloud/docker-compose.nextcloud.yml down
    umount /mnt/prod
    exit 1
fi
mylog "Backup disk fine"