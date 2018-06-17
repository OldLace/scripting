#!/bin/bash

#script to retrieve computer specs and put into specs.txt

hostname > specs.txt

sysctl -n machdep.cpu.brand_string >> specs.txt

system_profiler SPHardwareDataType | awk '/Serial/ {print $4}' >> specs.txt

ifconfig en1 | awk '/ether/{print $2}' >> specs.txt

diskutil info "Macintosh HD" |grep "Disk Size" >> specs.txt

diskutil info "Untitled" |grep "Disk Size" >> specs.txt

model=$(curl -s http://support-sp.apple.com/sp/product?cc=$(system_profiler SPHardwareDataType | sed -n '/Serial/s/.*: \(........\)\(.*\)$/\2/p')|sed 's:.*<configCode>\(.*\)</configCode>.*:\1:')
$model >> specs.txt




