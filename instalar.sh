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

echo -e "$menu
Instalador BadManager$fim"

read -p "Aperte em Enter para proseguir a instalação... "

echo -e "$cyanClaro
Instalando requisitos...$fim"

if [ "$1" = "--output" ]
then
sudo apt-get install python3 curl wget bc sudo bash git screen -y 
else
sudo apt-get install python3 curl wget bc sudo bash git screen -y 1>/dev/null 2>/dev/null
fi

echo -e "$cyanClaro
Baixando BadManager...$fim"
if [ "$1" = "--output" ]
then
git clone https://github.com/BadGuy552/BadManager.git /etc/BadManager
else
git clone https://github.com/BadGuy552/BadManager.git /etc/BadManager 1>/dev/null 2>/dev/null
fi

echo -e "$cyanClaro
Instalando BadManager...$fim"
mv /etc/BadManager/iniciar.py /bin/iniciar
chmod a+x /bin/iniciar
chmod a+x /etc/BadManager/*
chmod a+x /etc/BadManager/limite/limite.sh

echo -e "$verde Instalação Completa! $fim"
echo -e "Para executar o BadManager digite $amarelo iniciar$fim em seu Terminal."
exit 1

