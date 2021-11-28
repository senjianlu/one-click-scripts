#!/bin/bash

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 出现错误立即终止脚本
set -e

# 切换为我的压缩包以保证源仓库修改不会产生影响
clash_gz_url=https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/Clash/clash-linux-amd64-v1.2.0.gz
if [[ ${origin} == *"github"* ]];
then
    yum -y install wget
    wget $clash_gz_url
else
    curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%8B%E8%BD%BD%20Gitee%20%E8%B6%85%E8%BF%87%201%20MB%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%96%87%E4%BB%B6/download.sh | bash -s $clash_gz_url
fi
gunzip clash-linux-amd64-v1.7.1.gz

# 转移到 /usr/bin 使其在任意目录都可执行
mv clash-linux-amd64-v1.7.1 /usr/local/bin/clash
chmod 777 /usr/local/bin/clash

# 安装完成
echo "Clash 安装完成！"