#!/bin/bash

#Sauvegarde des sites webs

#sauvegarde 6
rm /home/sauvegarde/s7/* 2>>/var/log/scripts/RSauvegarde.log
mv /home/sauvegarde/s6/save.tar.gz /home/sauvegarde/s7 2>>/var/log/scripts/RSauvegarde.log
#sauvegarde 5
mv /home/sauvegarde/s5/save.tar.gz /home/sauvegarde/s6 2>>/var/log/scripts/RSauvegarde.log
#sauvegarde 4
mv /home/sauvegarde/s4/save.tar.gz /home/sauvegarde/s5 2>>/var/log/scripts/RSauvegarde.log
#sauvegarde 3
mv /home/sauvegarde/s3/save.tar.gz /home/sauvegarde/s4 2>>/var/log/scripts/RSauvegarde.log
#sauvegarde 2
mv /home/sauvegarde/s2/save.tar.gz /home/sauvegarde/s3 2>>/var/log/scripts/RSauvegarde.log
#sauvegarde 1
mv /home/sauvegarde/s1/save.tar.gz /home/sauvegarde/s2 2>>/var/log/scripts/RSauvegarde.log
tar czf /home/sauvegarde/s1/save.tar.gz /var/www 2>>/var/log/scripts/RSauvegarde.log
echo "nouvelle sauvegarde ajouté" >> /home/sauvegarde/info_sauvegarde.txt 2>>/var/log/scripts/RSauvegarde.log



