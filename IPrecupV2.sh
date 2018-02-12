#! /bin/bash
# On efface les IP datant de plus d'une heure
echo " " > /home/IPinfo.csv 2>>/var/log/scripts/IPrecupV2.log
egrep -o "([0-9]{1,3}\.){3}[0-9]{1,3}" /var/log/apache2/access.log.1 > /home/IPrecup.csv 2>>/var/log/scripts/IPrecupV2.log

date=`date +%d-%m-%H`
#ON collecte les informations
while read ligne
do
	curl ip-api.com/csv/$ligne > /home/api 2>>/var/log/scripts/IPrecupV2.log
	api=$(cat /home/api | cut -d \, -f 3) 2>>/var/log/scripts/IPrecupV2.log
	echo "$ligne,$api" >> /home/IPinfo.csv 2>>/var/log/scripts/IPrecupV2.log

done < /home/IPrecup.csv 2>>/var/log/scripts/IPrecupV2.log


