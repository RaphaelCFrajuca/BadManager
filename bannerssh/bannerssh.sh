#!/bin/bash


read -p "Digite sua mensagem para o Banner: " mensagem

echo "Banner /etc/BadManager/bannerssh/banner.txt" >> /etc/ssh/sshd_config

service ssh restart 


echo "Banner SSH aplicado com sucesso!"
