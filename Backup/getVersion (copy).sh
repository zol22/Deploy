#!/bin/bash
#check for version directory and create if it doesnt exist
if [ ! -d "$~/Desktop/ihungry/$1" ]; then
	sudo mkdir ~/ihungry/$1
fi

#pull front end folder
sshpass -p "njit2019" ssh arturo@192.168.0.160 "sudo tar -czf frontZip.tar.gz /var/www/html/Backup_iHungry/front;exit;"
sshpass -p "njit2019" scp arturo@192.168.0.160:~/frontZip.tar.gz ~/
sudo tar -xzf frontZip.tar.gz
sudo cp -r ~/var/www/html/Backup_iHungry/front ~/Desktop/ihungry/$1
sudo rm -r ~/var


#pull dmz folder
#sshpass -p "password" ssh afifa@192.168.0.
#"sudo tar -czf dmzZip.tar.gz folderLocation;exit;"
#sshpass -p "password" scp afifa@192.168.0. :~/dmzZip.tar.gz ~/
#sudo tar -xzf dmzZip.tar.gz
#sudo cp -r ~/zipedLocation ~/Desktop/ihungry/$1
#sudo rm -r ~/zipedLocation


#pull back end  folder
#sshpass -p "password" ssh zol22@192.168.0.   
#"sudo tar -czf backZip.tar.gz folderLocation;exit;"
#sshpass -p "password" scp zol22@192.168.0. :~/backZip.tar.gz ~/
#sudo tar -xzf backZip.tar.gz
#sudo cp -r ~/zipedLocation ~/Desktop/ihungry/$1
#sudo rm -r ~/zipedLocation


#Log
time=$(date +"%r")
date=$(date +"%D")
echo "$1 available        $time   $date" >> log.txt


