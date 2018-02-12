#!/bin/bash

#Sauvegarde complète des fichiers Apache
rm /home/sauvegarde/SComplete/* 2>>/var/log/scripts/Sauvegarde.log
tar czf /home/sauvegarde/SComplete/complete.tar.gz /etc/apache2 2>>/var/log/scripts/Sauvegarde.log

echo "Sauvegarde complète" >> /home/sauvegarde/info_sauvegarde.txt 2>>/var/log/scripts/Sauvegarde.log

