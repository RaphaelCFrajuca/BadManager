#!/usr/bin/python3

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

import subprocess

def backup():
	print(cyanClaro + "Fazendo Backup de todos os arquivos .deb instalados no sistema...." + fim)
	subprocess.call("sudo bash /etc/BadManager/debbackup/backup.sh", shell=True)
	print(verde + "Backup Finalizado com sucesso, o arquivo de backup esta em /root/deb.tar" + fim)
	
def restaurar():
	local = input(cyan + "Digite o caminho do arquivo de backup (deb.tar): " + fim)
	if local == "":
		print(vermelho + "Por favor insira um caminho!" + fim)
		restaurar()
	print(azulClaro + "Instalando pacotes...." +  fim)
	subprocess.call("sudo bash /etc/BadManager/debbackup/restaurar.sh " + local, shell=True)
	print(verde + "Pacotes instalados com sucesso!" + fim)

