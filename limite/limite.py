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
def deflimite():
	usuario=input(verde + "Insira o nome do usuario para adicionar no limite: " + fim)
	limite=str(input(verde + "Insira o limite para o usuario " + usuario + ": " + fim))
	subprocess.call("sudo bash /etc/BadManager/limite/deflimite.sh " + usuario + " " + limite, shell=True)

def remlimite():
	subprocess.call("sudo bash /etc/BadManager/limite/remlimite.sh", shell=True)

def gerlimite():
	subprocess.call("sudo bash /etc/BadManager/limite/limite.sh", shell=True)

