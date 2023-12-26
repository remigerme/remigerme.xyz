#!/bin/bash

echo Nextcloud setup : starting

read -p "UUID prod disk : " uuid_prod
if ! grep -q "$uuid_prod" /etc/fstab; then
    echo UUID=$uuid_prod /mnt/prod ext4 defaults 0 0 >> /etc/fstab
    echo Added prod disk to /etc/fstab
else
    echo Prod disk already in /etc/fstab, check config
fi

read -p "UUID backup disk : " uuid_backup
if ! grep -q "$uuid_backup" /etc/fstab; then
    echo UUID=$uuid_backup /mnt/backup ext4 defaults 0 0 >> /etc/fstab
    echo Added backup disk to /etc/fstab
else
    echo Backup disk already in /etc/fstab, check config
fi

[ ! -f nextcloud/disk.env ] && touch nextcloud/disk.env
if ! grep -q "UUID_PROD=" nextcloud/disk.env; then
    echo UUID_PROD=$uuid_prod >> nextcloud/disk.env
    echo Added prod disk to nextcloud/disk.env
else
    echo Prod disk already provided in nextcloud/disk.env, check config
fi
if ! grep -q "UUID_BACKUP=" nextcloud/disk.env; then
    echo UUID_BACKUP=$uuid_backup >> nextcloud/disk.env
    echo Added backup disk to nextcloud/disk.env
else
    echo Backup disk already provided in nextcloud/disk.env, check config
fi

mkdir -p /mnt/prod
mkdir -p /mnt/backup

mount -a

mkdir -p /mnt/prod/data
chown -R www-data:sudo /mnt/prod/data
chmod 750 /mnt/prod/data

mkdir -p /mnt/backup/data
chown -R www-data:sudo /mnt/backup/data
chmod 770 /mnt/backup/data
mkdir -p /mnt/backup/mysql
chown -R www-data:sudo /mnt/backup/mysql
chmod 770 /mnt/backup/mysql

echo Configuring backup crontab : starting
chmod +x nextcloud/backup.sh
crontab -l > rootcron
if ! grep -q "/home/raimmy/remigerme.xyz/nextcloud/backup.sh" rootcron; then
    echo '* 2 * * * /home/raimmy/remigerme.xyz/nextcloud/backup.sh' >> rootcron
    echo Configuring backup crontab : done
else
    echo Configuring backup crontab : already configured, check config 
fi

echo Configuring disk check crontab : starting
chmod +x nextcloud/disk.sh
if ! grep -q "/home/raimmy/remigerme.xyz/nextcloud/disk.sh" rootcron; then
    echo '*/15 * * * * /home/raimmy/remigerme.xyz/nextcloud/disk.sh' >> rootcron
    echo Configuring disk check crontab : done
else
    echo Configuring disk check crontab : already configured, check config
fi
crontab rootcron
rm rootcron

echo Nextcloud setup : done