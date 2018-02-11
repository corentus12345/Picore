#!/bin/bash

rm CheckSer.csv
#ping sur le serveur HTTP
ping -c 1 192.168.10.10 -q
result=${?}

if [ ${result} -eq 0 ];
then echo "Le serveur HTTP fonctionne correctement" >> CheckSer.csv
else echo "Le serveur HTTP ne répond pas" >> CheckSer.csv
fi

#Check du serveur DNS avec un ping du nom de domaine

ping -c 1 www.carnofluxe.local
result1=${?}

if [ ${result} -eq 0 ];
then echo "Le serveur DNS fonctionne correctement" >> CheckSer.csv
else echo "Le serveur DNS ne fonctionne pas" >> CheckSer.csv
fi

#acces au site et temps de réponse 
FORMAT="%{time_total} s"
curl -w "$FORMAT" -o /dev/null -s "www.carnofluxe.fr" >> CheckSer.csv
sed -i -e "s/,/./g" "CheckSer.csv"

#envoie du fichier en ssh 
ssh root@192.168.10.10
scp -p CheckSer.csv root@192.168.10.10:/home/
