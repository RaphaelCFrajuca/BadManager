#!/bin/bash

if [ -f /etc/BadManager/badvpn/... ]
then
echo "badvpn ja Instalado!"
exit 1
fi

echo "Atualizando repositorios apt..."
apt update 1>/dev/null 2>/dev/null && echo "Repositorios Atualizados com sucesso!" || update=false
if [ "$update" = false ]
then
echo "Erro ao Atualizar os repositorios, Abortando..."
exit 1
fi

echo "Instalando Dependencias...."

apt install python-nss 1>/dev/null 2>/dev/null && echo "python-nss Instalado!" || python-nss=false
if [ "$python-nss" = false ]
then
echo "Erro na instalação do python-nss, Abortando..."
exit 1
fi

apt install libnspr4-dev 1>/dev/null 2>/dev/null && echo "libnspr4-dev Instalado!" || libnspr4dev=false
if [ "$libnspr4-dev" = false ]
then
echo "Erro na instalação do libnspr4-dev, Abortando..."
exit 1
fi

apt install libnss3-dev 1>/dev/null 2>/dev/null && echo "libnss3-dev Instalado!" || libnss3dev=false
if [ "$libnss3dev" = false ]
then
echo "Erro na instalação do libnss3-dev, Abortando..."
exit 1
fi

apt install build-essential 1>/dev/null 2>/dev/null && echo "build-essential Instalado!" || buildessential=false
if [ "$buildessential" = false ]
then
echo "Erro na instalação do build-essential, Abortando..."
exit 1
fi

apt install cmake 1>/dev/null 2>/dev/null && echo "cmake Instalado!" || cmake=false
if [ "$cmake" = false ]
then
echo "Erro na instalação do cmake, Abortando..."
exit 1
fi

apt install make 1>/dev/null 2>/dev/null && echo "make Instalado!" || make=false
if [ "$make" = false ]
then
echo "Erro na instalação do make, Abortando..."
exit 1
fi

apt install git 1>/dev/null 2>/dev/null && echo "git Instalado!" || git=false
if [ "$git" = false ]
then
echo "Erro na instalação do git, Abortando..."
exit 1
fi

echo "Fazendo Download do badvpn Atualizado..."
BADVPNSOURCE=/etc/BadManager/badvpn/source/
rm -rf $BADVPNSOURCE 1>/dev/null 2>/dev/null
mkdir $BADVPNSOURCE
git clone https://github.com/ambrop72/badvpn.git $BADVPNSOURCE 1>/dev/null 2>/dev/null && echo "Download Terminado!" || download=false
if [ "$download" = false ]
then
echo "Erro ao fazer download do badvpn, Abortando..."
exit 1
fi

echo "Preparando source para ser compilada..."
cd $BADVPNSOURCE && cmake "-DEXECUTABLE_OUTPUT_PATH=$BADVPNSOURCE -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$BADVPNSOURCE -DRUNTIME_OUTPUT_DIRECTORY=$BADVPNSOURCE -DCMAKE_C_FLAGS="-std=gnu99 -march=native" -DBADVPN_THREAD_SAFE=0 -DBADVPN_LINUX -DBADVPN_BREACTOR_BADVPN -D_GNU_SOURCE -DBADVPN_USE_SIGNALFD -DBADVPN_USE_EPOLL -DBADVPN_LITTLE_ENDIAN" $BADVPNSOURCE 1>/dev/null 2>/dev/null && echo "Preparação Terminada!" || preparacao=false
if [ "$preparacao" = false ]
then
echo "Erro ao preparar source, Abortando..." 
exit 1
fi

echo "Iniciando compilação..." && sleep 4
cd $BADVPNSOURCE && make install && echo "Compilação bem Sucedida!" || compilacao=false
if [ "$compilacao" = false ]
then
echo "Erro ao Compilar, Abortando..."
exit 1
fi

echo "Iniciando badvpn..."

bash /etc/BadManager/badvpn/badvpn.sh && echo "badvpn Iniciado com Sucesso!" || badvpn=false
if [ "$badvpn" = false ]
then
echo "Erro ao iniciar o badvpn, Abortando..."
exit 1
fi

echo "Configurando badvpn para inicializar junto com o sistema..."
mv /etc/BadManager/badvpn/badvpn /etc/init.d/
chmod a+x /etc/init.d/badvpn
touch /etc/BadManager/badvpn/...

echo "Configuração Finalizada!"
exit 0
