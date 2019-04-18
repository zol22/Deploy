#!/bin/bash

read -p "Which machine are you sending to FE, BE, OR DMZ ? " M_TYPE

if [ $M_TYPE == "FE" ]
then
	IP_M="10.0.2.9"
	USER_M="haris"
	PASS_M="p"
	MACHINE_M="none"

	#sshpash -p "${PASS_M}" scp test.sh "${USER_M}"@"${IP_M}":~/Desktop/Get

	#echo "sent..."


elif [ $M_TYPE == "BE" ]
then
	IP_M="10.0.2.18"
	USER_M="emadt"
	PASS_M="password"
	MACHINE_M="none"

else

fi

sshpass -p "${PASS_M}" scp Greet.txt "${USER_M}"@"${IP_M}":~/Desktop/Get
echo "${USER_M}"
echo "sent..."
