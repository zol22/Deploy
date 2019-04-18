#!/bin/bash

#VERSION=$1
read -p "Which machine are you sending to FE, BE, OR DMZ ? " M_TYPE

if [ $M_TYPE == "FE" ]
then
	IP_M="192.168.0.160"
	USER_M="arturo"
	PASS_M="njit2019"


elif [ $M_TYPE == "BE" ]
then
	IP_M="10.0.2.14"
	USER_M="zol22"
	PASS_M="password2"

else
	IP_M="192.168.0.163"
	USER_M="afifa"
	PASS_M="password2"

fi

sshpass -p "${PASS_M}" scp -r ~/Desktop/Deploy_Unzip/${M_TYPE} "${USER_M}"@"${IP_M}":~/Desktop/QA_Received_Files/${M_TYPE}
echo "sent... to"
echo "${USER_M}"
