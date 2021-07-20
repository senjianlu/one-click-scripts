#!/bin/bash
# Clash 启动脚本

str=$"\n"
nohup /usr/local/bin/clash >/dev/null 2>&1 &
sstr=$(echo -e $str)
echo $sstr