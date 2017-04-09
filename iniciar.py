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
versao=menu + "1.1.2" + fim
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
	from debbackup import deb
	from servidor import configurar
	from criarusuariokey import criarusuariokey
except Exception as e:
	print(vermelho + "Erro ao Importar os Modulos!" + fim)
	print(str(e))
	exit()

if platform.system() != "Linux":
	print(vermelho + "Este Utilitario foi feito para funcionar somente em Linux!" + fim)
	sys.exit(2)
else:
	subprocess.call("clear", shell=True)
	print(menu + "		 BADMANAGER {} 		 ".format(versao) + fim)

def menuscript():
	print(amarelo + "[1] Criar Usuario (ROOT)" + fim)
	print(amarelo + "[2] Deletar Usuario (ROOT)" + fim)
	print(amarelo + "[3] Adicionar um usuario ao Limite de Logins (ROOT)" + fim)
	print(amarelo + "[4] Deletar um usuario do Limite de Logins (ROOT)" + fim)
	print(amarelo + "[5] Limite de Logins (ROOT)" + fim)
	print(amarelo + "[6] Backup de todos usuarios do sistema (ROOT)" + fim)
	print(amarelo + "[7] Restaurar todos os usuarios do sistema apartir do backup anterior (ROOT)" + fim)
	print(amarelo + "[8] Configurar SQUID3 (ROOT)" + fim)
	print(amarelo + "[9] Configurar SQUID (ROOT)" + fim)
	print(amarelo + "[10] Verificar informações do sistema (ROOT)" + fim)
	print(amarelo + "[11] Fazer backup dos pacotes ja instalados no sistema (ROOT)" + fim)
	print(amarelo + "[12] Restaurar backup de pacotes ja instalados no sistema (ROOT)" + fim)
	print(amarelo + "[13] Configurar esta maquina para ser usada como servidor remoto" + fim)
	print(amarelo + "[14] Conectar a um servidor remoto" + fim)
	print(amarelo + "[15] Mudar o limite de logins de um usuario (ROOT)" + fim)
	print(amarelo + "[16] Monitor de usuarios (ROOT)" + fim)
	print(amarelo + "[17] Criar Usuario com Chave Publica (ROOT)" + fim)
	print(amarelo + "[18] Adicionar um Banner SSH (ROOT)" + fim)
	print(amarelo + "[19] Firewall iptables pronto costumizado (TORRENT OFF)" + fim)
	print(amarelo + "[20] Compilar e configurar badvpn-udpgw" + fim)
	print(vermelho + "[Ctrl+C] Sair" + fim)
	try:
		opcao = input(azul + "Insira sua opção: " + fim)
		if opcao == '':
			print(vermelho + "Digite uma opção!" + fim)
			menuscript()
		else:
			opcao = int(opcao)

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
		subprocess.call("sudo wget -q https://github.com/BadGuy552/scripts/raw/master/squid3-install && sudo bash squid3-install && rm -f squid3-install", shell=True)
		menuscript()
	elif opcao == 9:
		subprocess.call("sudo bash /etc/BadManager/squid/squid.sh", shell=True)
	elif opcao == 10:
		subprocess.call("sudo bash /etc/BadManager/system/system.sh", shell=True)
		menuscript()
	elif opcao == 11:
		deb.backup()
		menuscript()
	elif opcao == 12:
		deb.restaurar()
		menuscript()
	elif opcao == 13:
		configurar.configurar()
		menuscript()
	elif opcao == 14:
		configurar.conectar()
		menuscript()
	elif opcao == 15:
		subprocess.call("sudo bash /etc/BadManager/limite/mudlimite.sh", shell=True)
		menuscript()
	elif opcao == 16:
		subprocess.call("sudo bash /etc/BadManager/limite/monitor.sh", shell=True)
		menuscript()
	elif opcao == 17:
		criarusuariokey.criarusuariokey()
		menuscript()
	elif opcao == 18:
		subprocess.call("sudo bash /etc/BadManager/bannerssh/bannerssh.sh", shell=True)
		menuscript()
	elif opcao == 19:
		subprocess.call("sudo bash /etc/BadManager/firewall/firewall.sh", shell=True)
		menuscript()
	elif opcao == 20:
		subprocess.call("sudo bash /etc/BadManager/badvpn/badvpn-configurar.sh", shell=True)
		menuscript()
	else:
		print(vermelho + "Digite uma opção valida!" + fim)
		menuscript()

menuscript()

