#!/bin/bash

#Sauvegarde complète des fichiers Apache
rm /home/sauvegarde/SComplete/*
tar czf /home/sauvegarde/SComplete/complete.tar.gz /etc/apache2

echo "Sauvegarde complète" >> /home/sauvegarde/info_sauvegarde.txt

