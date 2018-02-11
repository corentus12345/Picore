#! /bin/bash
# On efface les IP datant de plus d'une heure
echo " " > /home/IPinfo.csv 
egrep -o "([0-9]{1,3}\.){3}[0-9]{1,3}" /var/log/apache2/access.log.1 > /home/IPrecup.csv

date=`date +%d-%m-%H`
#ON collecte les informations
while read ligne
do
	curl ip-api.com/csv/$ligne > /home/api
	api=$(cat /home/api | cut -d \, -f 3)
	echo "$ligne,$api" >> /home/IPinfo.csv

done < /home/IPrecup.csv


