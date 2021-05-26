#!/bin/bash

# 判断服务器在国内还是国外来使用不同源
ip_info=$(curl http://ip-api.com/json/?lang=zh-CN)
if [[ ${ip_info} == *"中国"* ]];
then
    echo "当前服务器在境内，使用源：Gitee！"
    origin="gitee"
else
    echo "当前服务器在境外，使用源：GitHub！"
    origin="github"
fi
exit $origin