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

def configurar():
	ip=input(cyanClaro + "Digite seu IP: " + fim)
#ipadmin=input(cyan + "Digite o IP de seu servidor ADM: " + fim)

	print(azul + "Configurando requisitos..." + fim)

	iparq = open("/etc/BadManager/servidor/ip.txt", 'w')
	iparq.write(ip)
	iparq.close()

#ipadminarq = open("/etc/BadManager/servidor/admin.txt", 'w')
#ipadminarq.write(ipadmin)
#ipadminarq.close()

#print(amarelo + "Conectando ao servidor ADM..." + fim)
#import socket

#try:
#	srvadm = socket.socket()
#	srvadm.connect((ipadmin, 552))
#except:
#	print(vermelho + "Erro ao conectar ao servidor ADM..." + fim)
#	exit()

#print(amarelo + "Salvando mudanças no servidor ADM..." + fim)
#srvadm.send("sudo echo " + ip + " >> /etc/BadManager/servidor/servers.txt".encode())
	print(vermelho + "Seu servidor deve ter a porta 552 aberta!" + fim)
	print(amarelo + "Iniciando servidor..." + fim)
	import subprocess
	subprocess.call("sudo bash /etc/BadManager/servidor/configurar.sh " + ip, shell=True)

	print(verde + "Configurado com sucesso!" + fim)
	print("Utilize seu ip para se conectar remotamente!")

def adicionar():
	import subprocess
	subprocess.call("sudo bash /etc/BadManager/servidor/adicionar.sh", shell=True)


def conectar():
	import socket
	ip = input(cyanClaro + "Digite o IP do servidor no qual quer se conectar: " + fim)
	print(amarelo + "Conectando..." + fim)
	try:
		conexao = socket.socket()
		porta = 552
		conexao.connect((ip, porta))
		print(azul + "Conectado!" + fim)
		comando = input(amarelo + "Digite o comando para enviar ao seu servidor: " + fim)
		print(azul + "Enviando..." + fim)
		conexao.send(comando.encode())
		print(verde + "Comando enviado!" + fim)
		print("Encerrando..")
		conexao.close()

	except:
		print(vermelho + "Erro ao se conectar!" + fim)

