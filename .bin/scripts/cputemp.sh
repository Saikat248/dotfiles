#!/bin/sh

temp="$(sensors k10temp-pci-00c3 | grep Tdie | awk '{print $2}' | sed 's/+//;s/°C//')"
thresold=60

printf  "%s %s\\n" "" "$temp"

