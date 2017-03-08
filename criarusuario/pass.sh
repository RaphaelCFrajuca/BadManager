#!/bin/bash

pass=$1
user=$2
(echo $pass ; echo $pass) | passwd $user 1>/dev/null 2>/dev/null
