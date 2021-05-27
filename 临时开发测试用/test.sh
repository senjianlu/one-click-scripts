#!/bin/bash

# 脚本所在位置的绝对路径
# work_path=$(dirname $(readlink -f $0))
# echo $work_path

# 判断服务器在国内还是国外来使用不同源
# sh_content=$(curl -s https://raw.githubusercontent.com/senjianlu/one-click-scripts/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)
# echo $sh_content

# python3_version=$(python3 -V)
# echo $python3_version
if test -z $(python3 -V)
# if [[ $(python4 -V) == *"command not found"* ]];
then
    echo "安装出错！已保留 Python3 安装所需文件，请手动调试安装排查错误！"
    echo "请先去 /usr/local 路径下确认是否有名为 python3 的文件夹，如果有说明是在编译过程中出现错误，如果没有请检查本路径下是否下载成功 Python3 压缩包。"
else
    echo "安装成功！开始删除 Python3 安装所用的文件......"
    # 删除 Python3 压缩包和解压出的文件夹
    # rm -f Python-$version.tgz
    # rm -rf Python-$version
fi