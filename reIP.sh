#!/bin/bash
#On rajoute des ip dans le log du site web
echo "85.3.2.5" > /var/log/apache2/access.log.1
echo "186.233.2.5" >> /var/log/apache2/access.log.1
echo "55.5.55.5" >> /var/log/apache2/access.log.1


