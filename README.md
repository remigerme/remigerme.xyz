# remigerme.xyz

## Installation

Clone recursively this project (to also include `quartz` instance) :

```shell
git clone --recurse-submodules git@github.com:remigerme/remigerme.xyz.git
```

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

## Nextcloud update

See [this guide](https://github.com/nextcloud/docker?tab=readme-ov-file#update-to-a-newer-version), beware : upgrade major versions one by one.

## Collabora server

It runs on `office.remigerme.xyz`. SSL is disabled as Traefik already handles it as a reverse proxy. Still need to configure the WOPI list though.

## Blog

The blog is written with Obsidian, synced on the Nextcloud instance using [Remotely Save](https://github.com/remotely-save/remotely-save), and generated and served by [Quartz](https://github.com/jackyzha0/quartz).

> [!NOTE]
> The blog used to be written on, and served by, Notion. Even if Notion honestly feels great, I prefer having cleaner / human-readable URL slugs.

## YOURLS

[url.remigerme.xyz](https://url.remigerme.xyz) errors with 403 which is the intended behaviour. Check out `/admin` to manually install it the first time or manage short links.

## Frequent problems

If HTTPS certificates are self-signed, make sure to run `chmod 600 letsencrypt/acme.json` (happens frequently after a `git pull`).
