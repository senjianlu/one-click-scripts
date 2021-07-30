#!/bin/bash

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 下载 Chrome 安装包和 chromedriver 压缩包
chrome_rpm_url=https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/Chrome/google-chrome-stable_current_x86_64.rpm
chromedriver_zip_url=https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/Chrome/chromedriver_linux64.zip
if [[ ${origin} == *"github"* ]];
then
    wget $chrome_rpm_url
    wget $chromedriver_zip_url
else
    curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%8B%E8%BD%BD%20Gitee%20%E8%B6%85%E8%BF%87%201%20MB%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%96%87%E4%BB%B6/download.sh | bash -s $chrome_rpm_url
    curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%8B%E8%BD%BD%20Gitee%20%E8%B6%85%E8%BF%87%201%20MB%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%96%87%E4%BB%B6/download.sh | bash -s $chromedriver_zip_url
fi

# 安装 Chrome
yum -y localinstall google-chrome-stable_current_x86_64.rpm

# 解压并将 chromedriver 移至 /usr/bin 目录下以在任意目录都能调用
yum -y install unzip zip
unzip chromedriver_linux64.zip
mv chromedriver /usr/bin/

# 查看 Chrome 版本
google-chrome --version