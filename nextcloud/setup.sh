#!/bin/bash

echo Nextcloud setup : starting

read -p "UUID prod disk : " uuid_prod
if ! grep -q "$uuid_prod" /etc/fstab; then
    echo UUID=$uuid_prod /mnt/prod ext4 defaults 0 0 >> /etc/fstab
    echo Added disk to /etc/fstab
else
    echo Disk already in /etc/fstab, check config
fi

mkdir -p /mnt/prod
mount -a
mkdir -p /mnt/prod/data
chown -R www-data:sudo /mnt/prod/data
chmod 750 /mnt/prod/data

mkdir -p /mnt/backup
read -p "UUID backup disk : " uuid_backup
mount UUID=$uuid_backup /mnt/backup
mkdir -p /mnt/backup/data
chown -R www-data:sudo /mnt/backup/data
chmod 770 /mnt/backup/data
mkdir -p /mnt/backup/mysql
chown -R www-data:sudo /mnt/backup/mysql
chmod 770 /mnt/backup/mysql

if ! grep -q "UUID_BACKUP=" /nextcloud/.env; then
    echo UUID_BACKUP=$uuid_backup >> nextcloud/.env
    echo Added backup disk to nextcloud/.env
else
    echo Backup disk already provided in nextcloud/.env, check config
fi

chmod +x nextcloud/backup.sh
echo Nextcloud setup : done