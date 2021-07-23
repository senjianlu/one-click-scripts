#!/bin/bash
# ss-local start

nohup /usr/bin/ss-local -c /etc/shadowsocks-libev/config.json >/dev/null 2>&1 &