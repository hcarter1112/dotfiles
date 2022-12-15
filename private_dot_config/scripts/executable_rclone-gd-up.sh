#!/bin/bash

#The objective of this script is to copy the contents of some important folders from my the PC to gdrive
#rdir is the location for the rclone dir that will contain all of the directories to be synced
#dirna are the directory names contained in the rclone directory.
#nin stands for number in numbers and is a reference that will help with consistancy in the sync command.
rdir=/home/ralldi/Documents/rclone
dirna=(Obsidian HmT-Mats obs-media peruvian-taxes)
nin=0

#This expression is to check for the pressence of an rclone directory. If one does not exist, then one will be created.
if [ ! -d /home/ralldi/Documents/rclone ]
then
  /usr/bin/mkdir /home/ralldi/Documents/rclone
fi

for i in ${dirna[*]} 
do

#This expression is to check for the pressence of the folders within the rclone directory. It is dependant upon the directory names in the $dirna variable above.
#If the directories cannot be found, they will be created.
  if [ ! -d /home/ralldi/Documents/rclone/${dirna[$nin]} ]
  then
   /usr/bin/mkdir /home/ralldi/Documents/rclone/${dirna[$nin]}
  fi

  #This is the sync command that will sync the folders sequentially
  /usr/bin/rclone copy --update --transfers 30 --checkers 8 "/home/ralldi/Documents/rclone/${dirna[$nin]}" "gdrive:${dirna[$nin]}" 2>> /home/ralldi/.config/scripts/log/rclone-errors.log

  #This is to show the success or failure of the above sync command.
  if [ $? -eq 0 ]
  then
    /bin/echo "$(date)" >> /home/ralldi/.config/scripts/log/rclone-backup.log
    /bin/echo "----- ${dirna[$nin]} BACKUP COMPLETE" >> /home/ralldi/.config/scripts/log/rclone-backup.log
  else
    /bin/echo "$(date)" >> /home/ralldi/.config/scripts/log/rclone-errors.log  
    /bin/echo "${dirna[$nin]} backup failed" >> /home/ralldi/.config/scripts/log/rclone-errors.log 
  fi
  nin=$(( $nin +1 ))
done
