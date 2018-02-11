#!/bin/bash

#Sauvegarde des sites webs

#sauvegarde 6
rm /home/sauvegarde/s7/*
mv /home/sauvegarde/s6/save.tar.gz /home/sauvegarde/s7
#sauvegarde 5
mv /home/sauvegarde/s5/save.tar.gz /home/sauvegarde/s6
#sauvegarde 4
mv /home/sauvegarde/s4/save.tar.gz /home/sauvegarde/s5
#sauvegarde 3
mv /home/sauvegarde/s3/save.tar.gz /home/sauvegarde/s4
#sauvegarde 2
mv /home/sauvegarde/s2/save.tar.gz /home/sauvegarde/s3
#sauvegarde 1
mv /home/sauvegarde/s1/save.tar.gz /home/sauvegarde/s2
tar czf /home/sauvegarde/s1/save.tar.gz /var/www
echo "nouvelle sauvegarde ajouté" >> /home/sauvegarde/info_sauvegarde.txt



