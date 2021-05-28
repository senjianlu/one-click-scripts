#!/bin/bash
# 原脚本链接：https://raw.githubusercontent.com/qinghuas/socks5-install/master/socks5.sh

# 参数和其说明
ss5_port=$1
ss5_username=$2
ss5_password=$3

# 获取脚本执行的绝对路径
work_path=$(dirname $(readlink -f $0))

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 开放指定端口
opened_port=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%BC%80%E5%90%AF%E9%98%B2%E7%81%AB%E5%A2%99%E6%8C%87%E5%AE%9A%E7%AB%AF%E5%8F%A3/open-port.sh | bash -s $ss5_port)

# 出现错误立即终止脚本
# set -e

# 默认安装路径
install_path=/usr/local/share

# 安装环境包
yum -y install openssl-devel
yum -y install gcc
yum -y install pam-devel
yum -y install openldap-devel
# 下载、解压和安装
yum -y install wget
wget https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/ss5/ss5-3.8.9-8.tar.gz
tar -zxvf ss5-3.8.9-8.tar.gz
mv ss5-3.8.9 $install_path
cd $install_path/ss5-3.8.9
./configure && make && make install
# 新建 /var/run/ss5/ss5.pid 用文件夹
mkdir /var/run/ss5
# 开机自动新建文件夹防止 SOCKS5 开机启动出错
echo "@reboot mkdir -p /var/run/ss5" >> /var/spool/cron/root
service crond restart

# 回到脚本所在路径
cd $work_path
# 开启认证
sed -i "87c auth    0.0.0.0/0               -              u" /etc/opt/ss5/ss5.conf
sed -i "203c permit  u       0.0.0.0/0       -       0.0.0.0/0       -       -       -       -       -" /etc/opt/ss5/ss5.conf
# 新增用户
sed -i "1c $ss5_username $ss5_password" /etc/opt/ss5/ss5.passwd
# 修正 /etc/rc.d/init.d/ss5 文件语法错误
sed -i '18c  [[ ${NETWORKING} = "no" ]] && exit 0' /etc/rc.d/init.d/ss5
# 更改监听端口
sed -i "N;8iexport SS5_SOCKS_PORT=$ss5_port" /etc/rc.d/init.d/ss5
sed -i 'N;7aexport SS5_SOCKS_USER=root' /etc/rc.d/init.d/ss5

# 开启 SOCKS5 的开机自启动服务
chmod u+x /etc/rc.d/init.d/ss5
chkconfig --add ss5
chkconfig ss5 on

# 启动 ss5 服务
service ss5 start