#!/bin/bash

if [ -d /tmp/.deb ]
then
rm -rf /tmp/.deb
else
mkdir /tmp/.deb
fi

if [ -f /root/deb.tar ]
then
rm -f /root/deb.tar
fi

cp /var/cache/apt/archives/*.deb /tmp/.deb/

tar -zcf /root/deb.tar /tmp/.deb/*
