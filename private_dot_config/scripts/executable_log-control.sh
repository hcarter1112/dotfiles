#!/usr/bin/bash
# This file is to rotate the log files in my scripts folder so that I have 2 months of logs on hand at any given time.
if [[ -f  /home/ralldi/.config/scripts/log/rclone-backup.log.bak ]] # This is to avoid the error on the first run when there is no .bak file
then
    mv /home/ralldi/.config/scripts/log/rclone-backup.log.bak /home/ralldi/.config/scripts/log/rclone-backup.log.bak2
fi
mv /home/ralldi/.config/scripts/log/rclone-backup.log /home/ralldi/.config/scripts/log/rclone-backup.log.bak
