#!/bin/bash
# 原作者：老徐
# 原项目链接：https://github.com/the0demiurge

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 出现错误立即终止脚本
set -e

# 默认安装路径
install_path=/usr/local/share

# 切换为我的压缩包以保证源仓库修改不会产生影响
shadowsocks_tar_gz_url=https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/Shadowsocks/shadowsocks.tar.gz
if [[ ${origin} == *"github"* ]];
then
    yum -y install wget
    wget $shadowsocks_tar_gz_url
else
    curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%8B%E8%BD%BD%20Gitee%20%E8%B6%85%E8%BF%87%201m%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%96%87%E4%BB%B6/download.sh | bash -s $shadowsocks_tar_gz_url
tar -zxvf shadowsocks.tar.gz
mv shadowsocks $install_path

# 下载启动服务的脚本
wget https://$origin.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20Shadowsocks%20%E5%AE%A2%E6%88%B7%E7%AB%AF/%E5%90%AF%E5%8A%A8%E6%9C%8D%E5%8A%A1/ssr
mv ssr /usr/local/bin
chmod +x /usr/local/bin/ssr

# 安装完毕
echo "Shadowsocks 安装完毕！"
ssr help