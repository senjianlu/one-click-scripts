#!/bin/bash
# 原作者：老徐
# 原项目链接：https://github.com/the0demiurge

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 出现错误立即终止脚本
set -e

# 默认安装路径
install_path=/usr/local/share/shadowsocksr

# 切换为我的压缩包以保证源仓库修改不会产生影响
yum -y install wget
wget https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/ShadowsocksR/shadowsocksr.tgz
tar -xvf shadowsocks.tar /usr/local/share/shadowsocksr

# 下载启动服务的脚本
wget 
mv ssr /usr/local/bin
chmod +x /usr/local/bin/ssr

# 安装完毕
echo "ShadowsocksR 安装完毕！"
ssr help