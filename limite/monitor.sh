#!/bin/bash

menu="\033[41;1;37m"
corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"
fim="\033[0m"


while true
do
echo -e "$menu
			Monitor de Usuarios			$fim"
awk -F : '$3 >= 1000 { print $1 }' /etc/passwd |grep -v "nobody" > /etc/limite/users.txt
while read usuario
do
if [ "$usuario" ]
then
limite=$(cat /etc/limite/limite.txt | grep -w $usuario | awk '{print $2}')
if [ ! "$limite" ]
then
limite="$vermelho"N/A$fim
fi
usuarioo=$(echo $usuario | awk '{print $1}')
real=$(sudo ps x | grep ssh | grep -v grep | grep -v pts | grep $usuarioo | wc -l)
echo -e "$amarelo
Usuario: $usuarioo $real/$limite$fim"
fi
done < /etc/limite/users.txt
sleep 1
clear
done
