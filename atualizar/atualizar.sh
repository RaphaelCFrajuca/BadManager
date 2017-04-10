#!/bin/bash


echo "BadManager vai ser encerrado para que a atualização ocorra, favor aguardar alguns instantes..."

atualizar="#!/bin/bash
rm -rf /etc/BadManager
rm -f /bin/iniciar
git clone https://github.com/BadGuy552/BadManager.git /etc/BadManager
mv /etc/BadManager/iniciar.py /bin/iniciar
chmod a+x /bin/iniciar
echo "Atualizado com Sucesso!"
"

nome=$RANDOM.sh

echo "$atualizar" > /tmp/$nome

sudo bash /tmp/$nome

exit 0
