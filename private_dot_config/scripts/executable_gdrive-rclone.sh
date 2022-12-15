#!/bin/bash
date=$(date)
/bin/echo $date >> /home/ralldi/.config/scripts/gdrive.log &&
/usr/bin/rclone copy --update --transfers 30 --checkers 8 "/home/ralldi/Documents/Obsidian/" "gdrive:Obsidian" &&
  /bin/echo "-------------OBSIDIAN BACKUP COMPLETE-------------" >> /home/ralldi/.config/scripts/gdrive.log &&
/usr/bin/rclone copy --update --transfers 30 --checkers 8 "/home/ralldi/Documents/HmT-Mats/" "gdrive:HmT-Mats" &&
  /bin/echo "-------------HMT MATS BACKUP COMPLETE-------------" >> /home/ralldi/.config/scripts/gdrive.log &&
/usr/bin/rclone copy --update --transfers 30 --checkers 8 "/home/ralldi/Documents/obs-media/" "gdrive:obs-media" &&
  /bin/echo "-------------OBS MEDIA BACKUP COMPLETE-------------" >> /home/ralldi/.config/scripts/gdrive.log &&
/usr/bin/rclone copy --update --transfers 30 --checkers 8 "/home/ralldi/Documents/RxH/" "gdrive:peruvian-taxes" &&
  /bin/echo "-------------RxH BACKUP COMPLETE-------------" >> /home/ralldi/.config/scripts/gdrive.log
