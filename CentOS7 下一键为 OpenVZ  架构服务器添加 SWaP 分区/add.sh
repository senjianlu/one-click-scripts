#!/bin/bash
# 原教程链接：https://vzone.me/881/

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 下载启动服务的脚本并转移
yum -y install wget
wget https://$origin.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E4%B8%BA%20OpenVZ%20%20%E6%9E%B6%E6%9E%84%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%B7%BB%E5%8A%A0%20SWaP%20%E5%88%86%E5%8C%BA/%E5%85%B3%E8%81%94%E8%84%9A%E6%9C%AC/addswap.sh
mv addswap.sh /usr/bin/addswap.sh
chmod +x /usr/bin/addswap.sh

# 设置开机自动执行脚本
echo "/usr/bin/addswap.sh" >> /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local

# 执行脚本
sh /usr/bin/addswap.sh
# 查看虚拟内存是否增加成功
free -m