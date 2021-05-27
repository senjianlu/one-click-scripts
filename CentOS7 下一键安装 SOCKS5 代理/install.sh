#!/bin/bash
# 原脚本链接：https://raw.githubusercontent.com/qinghuas/socks5-install/master/socks5.sh

# 获取脚本执行的绝对路径
work_path=$(dirname $(readlink -f $0))

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 开放指定端口
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash

# 出现错误立即终止脚本
set -e

# 默认安装路径
install_path=/usr/local/share

# 下载、解压和安装
yum -y install wget
wget https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/ss5/ss5-3.8.9-8.tar.gz
tar -zxvf ss5-3.8.9-8.tar.gz
mv ss5-3.8.9 $install_path
cd $install_path/ss5-3.8.9
./configure && make && make install

# 回到脚本所在路径
cd $work_path
# 开启认证
sed -i "87c auth    0.0.0.0/0               -              u" /etc/opt/ss5/ss5.conf
sed -i "203c permit  u       0.0.0.0/0       -       0.0.0.0/0       -       -       -       -       -" /etc/opt/ss5/ss5.conf
rm -rf /etc/opt/ss5/ss5.passwd
# 修正 /etc/rc.d/init.d/ss5 文件语法错误
sed -i '18c  [[ ${NETWORKING} = "no" ]] && exit 0' /etc/rc.d/init.d/ss5

# 设置开机自启
chmod u+x /etc/rc.d/init.d/ss5
chkconfig --add ss5
chkconfig ss5 on
service ss5 start

