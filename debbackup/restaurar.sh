#!/bin/bash

arquivo=$1

tar -xf $arquivo 
dpkg -i tmp/.deb/*.deb
rm -rf tmp 