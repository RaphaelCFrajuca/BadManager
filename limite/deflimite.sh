#!/bin/bash

if [ ! -d /etc/limite ]
then
mkdir /etc/limite
fi

usuario=$1
limite=$2

verdeClaro="\033[1;32m"

if [[ "$1" && "$2" ]]
then
echo "$usuario $limite" >> /etc/limite/limite.txt
echo -e "$verde Usuario $usuario foi adicionado ao limite com Sucesso!$fim"
else
echo Erro
exit 2
fi
