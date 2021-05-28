#!/bin/bash

# 参数和其说明
nginx_reverse_port=$1
nginx_reverse_domain_my=$2
nginx_reverse_domain_it=$3

# 获取脚本执行的绝对路径
work_path=$(dirname $(readlink -f $0))

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 开放指定端口
opened_port=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%BC%80%E5%90%AF%E9%98%B2%E7%81%AB%E5%A2%99%E6%8C%87%E5%AE%9A%E7%AB%AF%E5%8F%A3/open-port.sh | bash -s $nginx_reverse_port)

# 事前准备
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
yum -y install epel-release

# Nginx 安装
yum -y install nginx

# 配置 Nginx
yum -y install wget
wget https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20Nginx%20%E5%8F%8D%E4%BB%A3%E6%8C%87%E5%AE%9A%E7%BD%91%E7%AB%99/%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6/nginx.conf -O nginx.conf
sed -i "45c \ \ \ \ \ \ \ \ listen       $nginx_reverse_port;" nginx.conf
sed -i "46c \ \ \ \ \ \ \ \ server_name  $nginx_reverse_domain_my;" nginx.conf
sed -i "54c \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ proxy_pass $nginx_reverse_domain_it;" nginx.conf
mv -f nginx.conf /etc/nginx/nginx.conf
chmod 777 /etc/nginx/nginx.conf
nginx -s reload

# 开机自启动 Nginx
systemctl enable nginx.service

# 启动 Nginx 服务
systemctl start nginx.service