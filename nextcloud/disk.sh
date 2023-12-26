#!/bin/bash

export $(xargs < /home/raimmy/remigerme.xyz/nextcloud/disk.env)

echo Checking prod disk
if ! blkid | grep -q "$UUID_PROD"; then
    echo Prod disk not found, shutting down
    docker compose -f /home/raimmy/remigerme.xyz/nextcloud/docker-compose.nextcloud.yml down
    umount /mnt/backup
    exit 1
fi
echo Prod disk fine

echo Checking backup disk
if ! blkid | grep -q "$UUID_BACKUP"; then
    echo Backpup disk not found, shutting down
    docker compose -f /home/raimmy/remigerme.xyz/nextcloud/docker-compose.nextcloud.yml down
    umount /mnt/prod
    exit 1
fi
echo Backup disk fine