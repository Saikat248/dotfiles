  1 #!/bin/sh
  2 
  3 temp="$(sensors k10temp-pci-00c3 | grep Tdie | awk '{print $2}' | sed 's/+//;s/°C//')"
  4 thresold=60
  5 
  6 
  7 if (( $(echo "$temp > $thresold"| bc -l) )) ; then
  8     icon="♨️ "
  9 else
 10     icon="🌡️ "
 11 fi
 12 
 13 printf  "%s %s\\n" "$icon" "$temp"

