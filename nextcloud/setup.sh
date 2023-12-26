#!/bin/bash

echo Nextcloud setup : starting

read -p "UUID prod disk : " uuid_prod
echo UUID=$uuid_prod /mnt/prod ext4 defaults 0 0 >> /etc/fstab

mkdir -p /mnt/prod
mount -a
mkdir -p /mnt/prod/data
chown -R www-data:sudo /mnt/prod/data
chmod 750 /mnt/prod/data

chmod +x nextcloud/backup.sh
echo Nextcloud setup : done