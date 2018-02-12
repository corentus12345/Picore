#!/bin/bash

rm CheckSer.csv 2>>/var/log/scripts/CheckServ.log
#ping sur le serveur HTTP
ping -c 1 192.168.10.10 -q 2>>/var/log/scripts/CheckServ.log
result=${?}

if [ ${result} -eq 0 ];
then echo "Le serveur HTTP fonctionne correctement" >> CheckSer.csv 2>>/var/log/scripts/CheckServ.log
else echo "Le serveur HTTP ne répond pas" >> CheckSer.csv 2>>/var/log/scripts/CheckServ.log
fi

#Check du serveur DNS avec un ping du nom de domaine

ping -c 1 www.carnofluxe.local 2>>/var/log/scripts/CheckServ.log
result1=${?}

if [ ${result} -eq 0 ];
then echo "Le serveur DNS fonctionne correctement" >> CheckSer.csv 2>>/var/log/scripts/CheckServ.log
else echo "Le serveur DNS ne fonctionne pas" >> CheckSer.csv 2>>/var/log/scripts/CheckServ.log
fi

#acces au site et temps de réponse 
FORMAT="%{time_total} s"
curl -w "$FORMAT" -o /dev/null -s "www.carnofluxe.fr" >> CheckSer.csv 2>>/var/log/scripts/CheckServ.log
sed -i -e "s/,/./g" "CheckSer.csv" 2>>/var/log/scripts/CheckServ.log

#envoie du fichier en ssh 
ssh root@192.168.10.10 2>>/var/log/scripts/CheckServ.log
scp -p CheckSer.csv root@192.168.10.10:/home/ 2>>/var/log/scripts/CheckServ.log
