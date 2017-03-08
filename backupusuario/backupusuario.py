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
import os
from zipfile import *

def backupusuarios():
	try:
		print(cyan + "Criando Backup dos usuarios..." + fim)
		backup = ZipFile("/root/backup.zip", 'a')
		backup.write("/etc/passwd")
		backup.write("/etc/shadow")
		backup.close()
		print(verde + "Backup feito com sucesso!" + fim)
		print(cyanClaro + "O arquivo de backup se encontra em /root/backup.zip" + fim)
	except Exception as e:
		print(vermelho + "Erro!" + fim)
		print(str(e))
		exit()

def restaurarusuarios():
	try:
		arquivozip = input(cyan + "Por favor ensira o Caminho do arquivo de backup: " + fim)
		backup = ZipFile(arquivozip, 'r')
		backup.extractall("/")
		print(cyanClaro + "Backup Restaurado com Sucesso!" + fim)

	except Exception as e:
		print(vermelho + "Erro!" + fim)
		print(str(e))
		exit()

