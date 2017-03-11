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
versao="1.0.2"
try:
	import os
	import platform
	import sys
	import subprocess
	sys.path.insert(0, "/etc/BadManager/")
	from criarusuario import criarusuario
	from deletarusuario import deletarusuario
	from limite import limite
	from backupusuario import backupusuario
except Exception as e:
	print(vermelho + "Erro ao Importar os Modulos!" + fim)
	print(str(e))
	exit()

if platform.system() != "Linux":
	print(vermelho + "Este Utilitario foi feito para funcionar somente em Linux!" + fim)
	sys.exit(2)
else:
	subprocess.call("clear", shell=True)
	print(menu + "		 BADMANAGER	" + versao + "	 " + fim)

def menuscript():
	print(cyan + "		Opções:" + fim)
	print(amarelo + "[1] Criar Usuario (ROOT)" + fim)
	print(amarelo + "[2] Deletar Usuario (ROOT)" + fim)
	print(amarelo + "[3] Adicionar um usuario ao Limite de Logins (ROOT)" + fim)
	print(amarelo + "[4] Deletar um usuario do Limite de Logins (ROOT)" + fim)
	print(amarelo + "[5] Limite de Logins (ROOT)" + fim)
	print(amarelo + "[6] Backup de todos usuarios do sistema (ROOT)" + fim)
	print(amarelo + "[7] Restaurar todos os usuarios do sistema apartir do backup anterior (ROOT)" + fim)
	print(amarelo + "[8] Configurar SQUID3 (ROOT)" + fim)
	try:
		opcao = int(input(azul + "Insira sua opção: " + fim))
	except KeyboardInterrupt:
		print(cyanClaro + "\nBye :P" + fim)
		exit(1)
	
	if opcao == 1:
		criarok = criarusuario.criarusuario()
		menuscript()
	elif opcao == 2:
		deletarok = deletarusuario.deletarusuario()
		menuscript()
	elif opcao == 3:
		addok = limite.deflimite()
		menuscript()
	elif opcao == 4:
		delok = limite.remlimite()
		menuscript()
	elif opcao == 5:
		gerok = limite.gerlimite()
		menuscript()
	elif opcao == 6:
		backupok = backupusuario.backupusuarios()
		menuscript()
	elif opcao == 7:
		restaurarok = backupusuario.restaurarusuarios()
		menuscript()
	elif opcao == 8:
		subprocess.call("sudo curl -sL https://github.com/BadGuy552/scripts/raw/master/squid3-install | sudo bash", shell=True)
		menuscript()

menuscript()

