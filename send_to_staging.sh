#!/bin/bash

#Script that deploy send to staging, script passes version number as parameter.
VERSION=$1

#FE
cd ~/Desktop/Deploy_Zip/${VERSION}/FE
#Create first the version directory;then the FE folder. QA ,must have Staging folder first!		
sshpass -p "njit2019" scp FE.zip arturo@192.168.0.164:~/Desktop/Staging/${VERSION}/FE #send to staging FE
sshpass -p "njit2019" ssh arturo@192.168.0.164 'mkdir  ~/Desktop/Staging/'${VERSION}';mkdir  ~/Desktop/Staging/'${VERSION}'/FE'	
	
#BE
cd ~/Desktop/Deploy_Zip/${VERSION}/BE
sshpass -p "babaji123" ssh zol22@192.168.0.165 'mkdir  ~/Desktop/Staging/'${VERSION}';mkdir  ~/Desktop/Staging/'${VERSION}'/BE'	
sshpass -p "babaji123" scp BE.zip zol22@192.168.0.165:~/Desktop/Staging/${VERSION}/BE


#DMZ
cd ~/Desktop/Deploy_Zip/${VERSION}/DMZ
sshpass -p "password1" ssh afifa@192.168.0.166 'mkdir  ~/Desktop/Staging/'${VERSION}';mkdir  ~/Desktop/Staging/'${VERSION}'/DMZ'	
sshpass -p "password1" scp DMZ.zip afifa@192.168.0.166:~/Desktop/Staging/${VERSION}/DMZ



