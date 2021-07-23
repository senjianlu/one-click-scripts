#!/bin/bash

# 出现错误立即终止脚本
set -e

# 安装高版本 libsodium 加密库
yum install epel-release
yum install libsodium libsodium-devel

# 安装 Shadowsocks-libev
cd /etc/yum.repos.d
curl -O https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
yum -y install shadowsocks-libev

# 启动服务
echo "配置文件路径：/etc/shadowsocks-libev/config.json"
echo "启动命令：/usr/bin/ss-local -c /etc/shadowsocks/shadowsocks.json"