#!/bin/bash
# gost stop

# GOST 本地转发端口
local_port=$1

# 如果指定了 GOST 转发的本地端口
if [ $local_port ]; then
    kill -9 $(pgrep -f "$local_port -F")
else
    kill -9 $(pgrep -f 'gost')
fi