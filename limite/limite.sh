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

if [ ! -f /etc/limite/limite.txt ]
then
echo -e "$vermelho Você deve primeiro adicionar usuarios ao Limite!$fim"
exit 2
else
echo ""
fi

while true
do
echo -e "$menu
			Limite de Usuarios			$fim"
while read usuario
do
limite=$(echo $usuario | awk '{print $2}')
usuarioo=$(echo $usuario | awk '{print $1}')
real=$(sudo ps x | grep ssh | grep -v grep | grep -v pts | grep $usuarioo | wc -l)
echo -e "$amarelo
Usuario: $usuarioo Conectados: $real$fim"
if [ "$real" -gt "$limite" ]
then
echo -e "$vermelho
Usuario: $usuarioo Sendo Desconectado por bater o limite!$fim"
proc=$(ps x | grep ssh | grep -v grep | grep -v pts | grep $usuarioo | awk '{print $1}')
kill -9 $proc
fi
done < /etc/limite/limite.txt
sleep 1
clear
done
