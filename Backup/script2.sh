#!/bin/bash

MACHINE_TYPE=$1
VERSION=$2

	# For Deploy VM = RORY
	IP_D="192.168.0.161"
	USER_M="rory"
	PASS_M="solaire"

IP_M="$(ifconfig enp0s3 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)"
echo " IP is: ${IP_M} ,Machine Type is: ${MACHINE_TYPE}, Version is ${VERSION}"

if [ $IP_M == "192.168.0.162" ] # Dev FE
then
	cd ~/Desktop/Development		
	zip FE_version_${VERSION}.zip FE/*
	#send to deploy VM	
	sshpass -p "${PASS_M}" scp FE_version_${VERSION}.zip "${USER_M}"@"${IP_D}":~/Desktop/Deploy/Get
	# unzip in deploy vm and move to new location	
	sshpass -p "${PASS_M}" ssh "${USER_M}"@"${IP_D}" 'unzip ~/Desktop/Deploy/Get/FE_version_'${VERSION}'.zip; mv ./FE ~/Desktop/Deploy/New'	
	

elif [ $IP_M == "192.168.0.163" ] # Dev BE
then
	cd ~/Desktop/Development
	zip BE_version_${VERSION}.zip BE/*
	sshpass -p "${PASS_M}" scp BE_version_${VERSION}.zip "${USER_M}"@"${IP_D}":~/Desktop/Deploy/Get
	sshpass -p "${PASS_M}" ssh "${USER_M}"@"${IP_D}" 'unzip ~/Desktop/Deploy/Get/BE_version_'${VERSION}'.zip; mv ./BE ~/Desktop/Deploy/New'

else [ $IP_M == "192.168.0.164" ] #Dev DMZ
	cd ~/Desktop/Development
	zip DMZ_version_${VERSION}.zip DMZ/*
	sshpass -p "${PASS_M}" scp DMZ_version_${VERSION}.zip "${USER_M}"@"${IP_D}":~/Desktop/Deploy/Get
	sshpass -p "${PASS_M}" ssh "${USER_M}"@"${IP_D}" 'unzip ~/Desktop/Deploy/Get/DMZ_version_'${VERSION}'.zip; mv ./DMZ ~/Desktop/Deploy/New'
fi

	
