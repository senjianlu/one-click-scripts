#!/bin/bash

# Firewalld 开放端口
firewall-cmd --add-port=$1/tcp --permanent
firewall-cmd --reload

# iptables 开放端口
iptables -I INPUT -p tcp --dport $1 -j ACCEPT
service iptables restart