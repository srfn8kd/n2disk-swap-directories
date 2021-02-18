#!/bin/bash

# I execute this at system start via /etc/rc.local

while true; do

ZFILE='/usr/local/bin/n2disk_ctl'

/bin/fgrep -q data2 $ZFILE

if [ $? -eq 0 ]
then
Z1=`/bin/cat /tmp/last-data2-file`
Z2=`/bin/find /data2/ -type f -name $Z1`
if [[ $Z2 =~ [a-zA-Z] ]]
then
sleep 2
else
echo "Updating n2disk data dir to data3"
/bin/ls -lR /data3 | /bin/tail -n 1 | /bin/awk '{print $9}' > /tmp/last-data3-file
/usr/bin/sed -i 's/data2/data3/' $ZFILE
/usr/bin/systemctl stop  n2disk.service
/usr/bin/systemctl start n2disk.service
fi
else
Z1=`/bin/cat /tmp/last-data3-file`
Z2=`/bin/find /data3/ -type f -name $Z1`
if [[ $Z2 =~ [a-zA-Z] ]]
then
sleep 2
else
echo "Updating n2disk data dir to data2"
/bin/ls -lR /data2 | /bin/tail -n 1 | /bin/awk '{print $9}' > /tmp/last-data2-file
/usr/bin/sed -i 's/data3/data2/' $ZFILE
/usr/bin/systemctl stop  n2disk.service
/usr/bin/systemctl start n2disk.service
fi
fi


done
