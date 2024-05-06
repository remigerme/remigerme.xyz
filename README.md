# remigerme.xyz

## Installation

Upload `.env` files to the `nextcloud` and `yourls` folders. Then :

```shell
chmod +x setup.sh && sudo ./setup.sh
```

## Run in production

Run everything :

```shell
sudo ./start.sh
```

## Nextcloud backup

A daily backup is done at 2AM.

Disks are checked every 15min. Disable cron task when doing maintenance.

To enable maintenance mode :

```shell
sudo docker exec -u www-data nextcloud php /var/www/html/occ maintenance:mode --on
```

From time to time, manually run :

```shell
sudo rsync -Aau --delete /mnt/prod/data/ /mnt/backup/data/
```

The delete flag allows you to remove junk files from previous backups which don't exist anymore. Do not cron it as it might erase backup if prod disk fails.

## Collabora server

It runs on `office.remigerme.xyz`. SSL is disabled as Traefik already handles it as a reverse proxy. Still need to configure the WOPI list though.

## Blog

The blog is hosted by default Notion website service. I'm just using a Cloudflare as a (more or less) proxy pass (cf. Fruition) which allows me to use [blog.remigerme.xyz](https://blog.remigerme.xyz).

## YOURLS

[url.remigerme.xyz](https://url.remigerme.xyz) errors with 403 which is the intended behaviour. Check out `/admin` to manually install it the first time or manage short links.
