#!/bin/bash
date=$(date)
/bin/echo $date >> /home/ralldi/.config/scripts/gdrive.log &&
/usr/bin/rclone sync  --transfers 30 --checkers 8 "gdrive:Obsidian" "/home/ralldi/Documents/Obsidian/" &&
  /bin/echo "-------------OBSIDIAN BACKUP COMPLETE-------------" >> /home/ralldi/.config/scripts/gdrive.log &&
/usr/bin/rclone sync  --transfers 30 --checkers 8 "gdrive:HmT-Mats" "/home/ralldi/Documents/HmT-Mats/" &&
  /bin/echo "-------------HMT MATS BACKUP COMPLETE-------------" >> /home/ralldi/.config/scripts/gdrive.log &&
/usr/bin/rclone sync  --transfers 30 --checkers 8 "gdrive:obs-media" "/home/ralldi/Documents/obs-media/" &&
  /bin/echo "-------------OBS MEDIA BACKUP COMPLETE-------------" >> /home/ralldi/.config/scripts/gdrive.log &&
/usr/bin/rclone sync  --transfers 30 --checkers 8 "gdrive:peruvian-taxes" "/home/ralldi/Documents/peruvian-taxes/" &&
  /bin/echo "-------------RxH BACKUP COMPLETE-------------" >> /home/ralldi/.config/scripts/gdrive.log
