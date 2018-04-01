#!/bin/bash


CPU=`awk '/model name/ ' /proc/cpuinfo | uniq | cut -b 13-150`
RAM=`awk '/MemTotal/ {print $2,$3}' /proc/meminfo`
MB=`dmidecode -s baseboard-product-name` #MB name
MBM=`dmidecode -s baseboard-manufacturer` #MB manufacturer
MBSN=`dmidecode -s baseboard-serial-number` #MB Serial number
SSN=`dmidecode -s system-serial-number`
OSD=`lsb_release -sd`
KV=`uname -r`
IDATE=`tune2fs -l /dev/sda1 | grep 'Filesystem created:' | awk '{print $3,$4,$5,$6,$7}'`
HN=`hostname`
UT=`uptime -p | cut -b 4-99`
PSRUN=`ps -A --no-headers | wc -l`
ULOG=`users | wc -l`
IFN=`ip -br a | awk '{print $1":"}'`
IFNAD=`ip -br a | awk '{print $3}'`

echo "---Hardware---" >> task4_1out.sh
echo "CPU:" $CPU >> task4_1out.sh
echo "RAM:" $RAM >> task4_1out.sh
echo "Motherboard:" $MB/$MBM/$MBSN >> task4_1out.sh
echo "System serial number:" $SSN >> task4_1out.sh
echo "---System---" >> task4_1out.sh
echo "OS Distribution:" $OSD >> task4_1out.sh
echo "Kernel version:" $KV >> task4_1out.sh
echo "Installation date:" $IDATE >> task4_1out.sh
echo "Hostname:" $HN >> task4_1out.sh
echo "Uptime:" $UT >> task4_1out.sh
echo "Processes runnung:" $PSRUN >> task4_1out.sh
echo "Users logged in:" $ULOG >> task4_1out.sh
echo "---Network---" >> task4_1out.sh
echo $IFN $IFNAD >> task4_1out.sh