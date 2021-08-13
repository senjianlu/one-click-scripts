#!/bin/bash
# gost start

# 参数何其说明
gost_username=$1
gost_password=$2
gost_port=$3
proxy_host=$4
proxy_port=$5

nohup gost -L $gost_username:$gost_password@:$gost_port -F=socks5://$proxy_host:$proxy_port >/dev/null 2>&1 &