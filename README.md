# remigerme.xyz

## Installation
Upload `.env` file to the `nextcloud` folder. Then :
```
chmod +x setup.sh && sudo ./setup.sh
```

## Run in production
Run everything :
```
sudo ./start.sh
```

## Backup
A daily backup is done at 2AM.

Disks are checked every 15min. Disable cron task when doing maintenance.

From time to time, manually run :
```
sudo rsync -Aau --delete /mnt/prod/data/ /mnt/backup/data/
```
The delete flag allows you to remove junk files from previous backups which don't exist anymore. Do not cron it as it might erase backup if prod disk fails.

## Blog
The blog is hosted by default Notion website service. I'm just using a Cloudflare as a (more or less) proxy pass (cf. Fruition) which allows me to use [blog.remigerme.xyz](https://blog.remigerme.xyz).