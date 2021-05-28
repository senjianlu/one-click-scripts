#!/bin/bash

# 参数和其说明
tinyproxy_port=$1
tinyproxy_username=$2
tinyproxy_password=$3

# 获取脚本执行的绝对路径
work_path=$(dirname $(readlink -f $0))

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 开放指定端口
opened_port=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%BC%80%E5%90%AF%E9%98%B2%E7%81%AB%E5%A2%99%E6%8C%87%E5%AE%9A%E7%AB%AF%E5%8F%A3/open-port.sh | bash -s $tinyproxy_port)

# 默认安装路径
install_path=/usr/local/share

# 安装环境包
yum -y install openssl-devel
yum -y install gcc
yum -y install pam-devel
yum -y install openldap-devel
# 卸载旧版本 TinyProxy
# yum -y erase tinyproxy
yum -y install wget
wget https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/Tinyproxy/tinyproxy-1.11.0-rc1.tar.gz
tar -zxvf tinyproxy-1.11.0-rc1.tar.gz
mv tinyproxy-1.11.0-rc1 $install_path
cd $install_path/tinyproxy-1.11.0-rc1
./configure && make && make install

# 配置 Tinyproxy
mkdir $install_path/config
wget https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20Tinyproxy%20%E4%BB%A3%E7%90%86/%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6/tinyproxy.conf -O tinyproxy.conf
mv tinyproxy.conf $install_path/config
sed -i "23c Port $tinyproxy_port" $install_path/config/tinyproxy.conf
sed -i "206c BasicAuth $tinyproxy_username $tinyproxy_password" $install_path/config/tinyproxy.conf

# 开机自动启动
echo "@reboot /usr/local/bin/tinyproxy -c $install_path/config/tinyproxy.conf" >> /var/spool/cron/root
service crond restart

# 启动 Tinyproxy 服务
/usr/local/bin/tinyproxy -c $install_path/config/tinyproxy.conf