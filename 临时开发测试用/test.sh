#!/bin/bash

# 脚本所在位置的绝对路径
# work_path=$(dirname $(readlink -f $0))
# echo $work_path

# 判断服务器在国内还是国外来使用不同源
sh_content=$(curl -s https://raw.githubusercontent.com/senjianlu/one-click-scripts/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)
echo $sh_content