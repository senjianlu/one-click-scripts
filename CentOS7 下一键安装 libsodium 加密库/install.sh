#!/bin/bash
# 参考文章：https://www.icode9.com/content-4-224432.html

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 事前准备
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
yum groupinstall "Development Tools" -y

# 下载、解压和安装
libsodium_tgz_url=https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/libsodium/libsodium-1.0.10.tar.gz
if [[ ${origin} == *"github"* ]];
then
    yum -y install wget
    wget $libsodium_tgz_url
else
    curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%8B%E8%BD%BD%20Gitee%20%E8%B6%85%E8%BF%87%201%20MB%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%96%87%E4%BB%B6/download.sh | bash -s $libsodium_tgz_url
fi
tar -xvf libsodium-1.0.10.tar.gz
cd libsodium-1.0.10
./configure --prefix=/usr/local/libsodium
make -j8 && make install

# 添加运行库位置并加载运行库
sed -i '$a /lib' /etc/ld.so.conf
sed -i '$a /usr/lib64' /etc/ld.so.conf
sed -i '$a /usr/local/lib' /etc/ld.so.conf
sed -i '$a /usr/local/libsodium/lib' /etc/ld.so.conf

# 使配置生效
ldconfig