#!/bin/sh


dwm_disk () {

     STO=$(df -h $HOME| awk 'NR==2 {print $4}')
     #echo  " " $STO
     printf "%s" "$SEP1"
     if [ "$IDENTIFIER" = "" ]; then
         printf "  %s %s" "$STO"
     else
         printf "  %s %s" "$STO"
     fi
     printf "%s\n" "$SEP2"

}

dwm_disk
