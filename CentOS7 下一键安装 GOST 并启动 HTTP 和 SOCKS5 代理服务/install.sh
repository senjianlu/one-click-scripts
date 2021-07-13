#!/bin/bash

# 参数和其说明
# 由于 GOST 支持监听同一端口上不同协议的流量，因此只需要配置一个端口即可
proxy_port=$1
proxy_username=$2
proxy_password=$3

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 事前准备
yum -y install golang

# 下载并解压
gost_gz_url=https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/libsodium/libsodium-1.0.10.tar.gz
if [[ ${origin} == *"github"* ]];
then
    yum -y install wget
    wget $gost_gz_url
else
    curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%8B%E8%BD%BD%20Gitee%20%E8%B6%85%E8%BF%87%201%20MB%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%96%87%E4%BB%B6/download.sh | bash -s $gost_gz_url
fi
gunzip gost-linux-amd64-2.11.1.gz

# 转移到 /usr/bin 使其在任意目录都可执行
mv gost-linux-amd64-2.11.1 /usr/bin/gost
chmod 777 /usr/bin/gost

# 开启开机自启动
echo "@reboot gost -L $2:$3@:$1" >> /var/spool/cron/root
service crond restart

# 启动
nohup gost -L $2:$3@:$1 &