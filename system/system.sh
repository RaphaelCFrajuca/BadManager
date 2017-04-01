 #!/bin/bash

if [[ ! /proc/cpuinfo && ! $(which dmidecode) ]]
then
echo "Error Getting System Information."
exit 0
fi
if [ ! /etc/issue.net ]
then
echo "Error Getting System Information."
exit 0
fi
if [ ! /proc/meminfo ]
then
echo "Error Getting System Information."
exit 0
fi

system=$(cat /etc/issue.net)
boardmanufacture=$(sudo dmidecode -t baseboard | grep "Manufacturer:" | awk -F ":" '{print $2}')
productname=$(sudo dmidecode -t baseboard | grep "Product Name:" | awk -F ":" '{print $2}')
based=$(cat /etc/*release | grep ID_LIKE | awk -F "=" '{print $2}')
processor=$(cat /proc/cpuinfo | grep "model name" | uniq | awk -F ":" '{print $2}')
cpus=$(cat /proc/cpuinfo | grep processor | wc -l)
voltageprocessor=$(sudo dmidecode -t processor | grep Voltage | awk '{print $2" "$3}')
familyprocessor=$(sudo dmidecode -t processor | grep Family: | awk '{print $2" "$3}')
processortype=$(sudo dmidecode -t processor | grep Type: | awk '{print $2" "$3}')
diskdevice=$(df -h | grep -w "/" | awk '{print $1}')
disktotal=$(df -h | grep -w "/" | awk '{print $2}')
diskusage=$(df -h | grep -w "/" | awk '{print $3}')
diskfree=$(df -h | grep -w "/" | awk '{print $4" "$5}')


echo "Board Manufacturer: $boardmanufacture"
echo "Product Name: $productname"

if [ "$system" ]
then

echo "System: $system"
else
echo "System: Not Available"
fi
if [ "$based" ]
then
echo "Its a $based-like"
else
echo "Based system not Available"
fi
if [ "$processor" ]
then
echo "Processor: $processor x$cpus"
else
echo "Processor: Not Available"
fi
clock=$(lscpu | grep "CPU MHz" | awk '{print $3}')
if [ "$clock" ]
then
echo "Clock: $clock MHz"
else
echo "Clock: Not Available"
fi
echo "Processor Voltage: $voltageprocessor"
echo "Processor Type: $processortype"
echo "Processor Family: $familyprocessor" 
echo "$(ps aux  | awk 'BEGIN { sum = 0 }  { sum += sprintf("%f",$3) }; END { printf "CPU Usage: " "%.2f" "%%", sum}')"
totalram=$(free | grep Mem | awk '{print $2}')
usedram=$(free | grep Mem | awk '{print $3}')
freeram=$(free | grep Mem | awk '{print $4}')
swapram=$(cat /proc/meminfo | grep SwapTotal | awk '{print $2}')
typeram=$(dmidecode -t memory | grep "Type: " | grep -v "Error" | uniq | awk '{print $2}')
slotsram=$(sudo dmidecode -t memory | grep Size | wc -l)

echo "RAM TOTAL: $(($totalram / 1024))MB USED: $(($usedram / 1024))MB FREE: $(($freeram / 1024))MB SWAP: $(($swapram / 1024))MB "
echo "Type of RAM: $typeram"
echo "Number of RAM Slots: $slotsram"
echo "$(sudo dmidecode -t memory | grep Size -n  | awk '{print $3" "$4" "$5}')" > /tmp/raminfo
i=0
while read value
do
i=$(($i + 1))
echo Slot "$i": "$value"
done < /tmp/raminfo
echo "Disk Device: $diskdevice"
echo "Disk Total: $disktotal"
echo "Disk Using: $diskusage"
echo "Disk Free: $diskfree"

echo "Uptime: $(uptime)"
echo "Hostname: $(hostname)"
echo "IP: $(ip addr | grep inet | grep -v inet6 | grep -v "host lo" | awk '{print $2}' | awk -F "/" '{print $1}')"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
exit 1
