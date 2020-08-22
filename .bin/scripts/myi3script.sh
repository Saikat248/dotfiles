#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do 
    read line 
    memory=`free -h | awk '/^Mem:/ {print $3 "/" $2}'`
    temp=`bash /home/saikat/.bin/scripts/cputemp.sh`
    weather=`bash /home/saikat/.bin/scripts/weather.sh`
    gmail=`python2 gmail.py -u saikat403 -p S@ikat15CY40031 -v -r 60`
    echo "$gmail📧️ | $weather | 💾️ $memory | $temp | $line" || exit 1 
done
    
    
   


