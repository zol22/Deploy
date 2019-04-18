#!/bin/bash

#Script that deploy run 
MACHINE_TYPE=$1
VERSION=$2

if [ $MACHINE_TYPE == "FE" ]
then
	IP_M="192.168.0.160"
	USER_M="arturo"
	PASS_M="njit2019"


	sshpass -p "${PASS_M}" ssh "${USER_M}"@"${IP_M}" "cd ~/Sites/www/html/Website; zip -r '${MACHINE_TYPE}'.zip bootstrap/*;mv '${MACHINE_TYPE}'.zip ~/Desktop/'${MACHINE_TYPE}'"
			 

elif [ $MACHINE_TYPE == "BE" ]
then
	
	IP_M="10.0.2.14"
	USER_M="zol22"
	PASS_M="password2"

	

	sshpass -p "${PASS_M}" ssh "${USER_M}"@"${IP_M}" "cd ~/Sites/www/html/Backend; zip -r '${MACHINE_TYPE}'.zip *;mv '${MACHINE_TYPE}'.zip ~/Desktop/'${MACHINE_TYPE}'"
			 
	
	

else
	IP_M="192.168.0.163"
	USER_M="afifa"
	PASS_M="password2"


	sshpass -p "${PASS_M}" ssh "${USER_M}"@"${IP_M}" "cd ~/Sites/www/html/DMZ; zip -r '${MACHINE_TYPE}'.zip *;mv '${MACHINE_TYPE}'.zip ~/Desktop/'${MACHINE_TYPE}'"
			 
	

fi

mkdir ~/Desktop/Deploy_Zip/${MACHINE_TYPE}/${VERSION}
mkdir ~/Desktop/Deploy_Unzip/${MACHINE_TYPE}/${VERSION}

sshpass -p "${PASS_M}" scp -r "${USER_M}"@"${IP_M}":~/Desktop/${MACHINE_TYPE}/${MACHINE_TYPE}.zip ~/Desktop/Deploy_Zip/${MACHINE_TYPE}/${VERSION}

cd ~/Desktop/Deploy_Unzip/${MACHINE_TYPE}/${VERSION}
unzip ~/Desktop/Deploy_Zip/${MACHINE_TYPE}/${VERSION}/${MACHINE_TYPE}.zip 

