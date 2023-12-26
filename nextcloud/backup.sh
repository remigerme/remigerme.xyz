sudo mount UUID=uuid_here_backup /mnt/backup
echo Disk mounted

echo Starting data folder backup
sudo rsync -Aax /mnt/prod/data/ /mnt/backup/data/
echo Data folder backup done

sudo umount /mnt/backup
echo Disk unmounted, backup done