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
echo -e "$vermelho
Você deve primeiro Adicionar um limite a algum usuario para poder remover o mesmo!$fim"
exit 2
else
echo ""
fi
echo -e "$menu
Remover Usuarios do Limite:$fim"

usuario=$(cat /etc/limite/limite.txt | awk '{print $1}')

echo "$usuario"
read -p "Digite o nome do usuario para ser removido, ou digite 'sair' para sair: " remover
if [ "$remover" = "sair" ]
then
exit 1
else
echo -e "$verde
Removendo usuario $remover do limite...$fim"

novolimite="$(cat /etc/limite/limite.txt | grep -wv "$remover")"
echo "$novolimite" > /etc/limite/limite.txt
echo -e "$cyan
Removido com sucesso!$fim"
exit 1
fi
