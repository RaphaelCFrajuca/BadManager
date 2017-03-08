import os
import platform
import sys
import subprocess
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

def criarusuario():
	subprocess.call("sudo groupadd badmanager 1>/dev/null 2>/dev/null", shell=True)
	usuario = input(verde + "Insira um nome para o usuario: " + fim)
	senha = input(verde + "Insira uma senha: " + fim)
	validade = input(verde + "Deseja adicionar uma validade para o usuario " + usuario + "? (s/n) " + fim)
	if validade == "s":
		validade = input(verde + "Digite uma validade: " + fim)
		subprocess.call("sudo useradd -g badmanager -M -N -s /bin/false " + usuario + " -e " + validade, shell=True)
		subprocess.call("sudo bash /etc/BadManager/criarusuario/pass.sh " + senha, shell=True)
		sys.path.insert(0, "/etc/BadManager/")
		from limite import limite
		limite.deflimite()
		print(cyan + "Usuario " + usuario + " Criado com sucesso!" + fim)
		print(cyan + "Dados: " + fim)
		print(cyan + "Usuario: " + usuario + fim)
		print(cyan + "Senha: " + senha + fim)
		print(cyan + "Validade: " + validade + fim)
		return True
	else:
		subprocess.call("sudo useradd -M -N -s /bin/false " + usuario, shell=True)
		subprocess.call("sudo bash /etc/BadManager/criarusuario/pass.sh " + senha + " " + usuario, shell=True)
		print(cyan + "Usuario " + usuario + " Criado com sucesso!" + fim)
		print(cyan + "Dados:\n" + fim)
		print(cyan + "Usuario: " + usuario + fim)
		print(cyan + "Senha: " + senha + fim)
		return True
