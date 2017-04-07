#!/bin/bash

read -p "Digite seu IP: " ip

echo Apagando todas as regras.

# Apagando todas as regras
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

echo Bloqueando tudo..

# Mudando a politica - Começa bloqueando tudo
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

echo Liberando conexões pre-estabelecidas...

# Libera conexões pre-estabelecidas
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

echo Liberando HTTPS....

# Liberar HTTPS
iptables -A OUTPUT -p tcp -d $ip --dport 443 -m state --state NEW -j ACCEPT

echo Liberando HTTP.....

# Liberar HTTP
iptables -A OUTPUT -p tcp -d $ip --dport 80 -m state --state NEW -j ACCEPT

echo Liberando DNS......

# Liberar DNS
iptables -A OUTPUT -p tcp --dport 53 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -m state --state NEW -j ACCEPT

echo Liberando DHCP.......

#Liberar DHCP
iptables -A OUTPUT -p tcp --dport 67 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p udp --dport 67 -m state --state NEW -j ACCEPT

echo Liberando SSH........

#Liberar SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT

echo Liberando SQUID.........

#Liberar SQUID
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 3128 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8080 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 3128 -j ACCEPT
iptables -A FORWARD -p tcp --dport 8080 -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --dport 3128 -j ACCEPT
iptables -A INPUT -p tcp --dport 8799 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8799 -j ACCEPT
iptables -A FORWARD -p tcp --dport 8799 -j ACCEPT

echo Liberando WEBMIN.......

#Liberar WEBMIN
iptables -A INPUT -p tcp --dport 10000 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 10000 -j ACCEPT

echo Regras Inseridas com Sucesso.
