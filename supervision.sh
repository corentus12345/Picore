#!/bin/bash
#permet d'actualiser le site supervision.carnofluxe avec les données des client récupérer ultèrieurement.
echo " " > /var/www/html/supervision.carnofluxe.local/index.html 2>>/var/log/scripts/supervision.log
csv2html -o /var/www/html/supervision.carnofluxe.local/index.html /home/IPinfo.csv 2>>/var/log/scripts/supervision.log

