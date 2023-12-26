#!/bin/bash

export $(xargs < /home/raimmy/remigerme.xyz/nextcloud/disk.env)

echo Checking prod disk
if ! lsblk | grep -q "/mnt/prod"; then
    echo Prod disk not found, shutting down
    docker compose -f /home/raimmy/remigerme.xyz/nextcloud/docker-compose.nextcloud.yml down
    umount /mnt/backup
    exit 1
fi
echo Prod disk fine

echo Checking backup disk
if ! lsblk | grep -q "/mnt/backup"; then
    echo Backpup disk not found, shutting down
    docker compose -f /home/raimmy/remigerme.xyz/nextcloud/docker-compose.nextcloud.yml down
    umount /mnt/prod
    exit 1
fi
echo Backup disk fine