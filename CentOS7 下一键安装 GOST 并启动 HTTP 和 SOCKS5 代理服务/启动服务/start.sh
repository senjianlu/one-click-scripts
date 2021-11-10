#!/bin/bash
# GOST 启动脚本增强版

while getopts ":a::u::d::h::p:A::U::D::H::P:" opt; do
    case $opt in
    # 本地协议
    a)
        local_agreement=$OPTARG
        ;;
    # 本地用户名
    u)
        local_username=$OPTARG
        ;;
    # 本地密码
    d)
        local_password=$OPTARG
        ;;
    # 本地 IP 地址
    h) 
        local_host=$OPTARG
        ;;
    # 本地端口
    p) 
        local_port=$OPTARG
        ;;
    # 代理协议
    A)
        proxy_agreement=$OPTARG
        ;;
    # 代理用户名
    U)
        proxy_username=$OPTARG
        ;;
    # 代理密码
    D)
        proxy_password=$OPTARG
        ;;
    # 代理 IP 地址
    H) 
        proxy_host=$OPTARG
        ;;
    # 代理端口
    P) 
        proxy_port=$OPTARG
        ;;
    :)
        echo "注意：-$OPTARG 必须设值！" 
        exit 1
        ;;
    ?)
        echo "未知参数: -$OPTARG 索引:$OPTIND"
        ;;
  esac
done

# 最终命令
start_gost_command=

# 根据各参数配置命令
start_gost_command=$start_gost_command"nohup gost"
# === 本地 ===
start_gost_command=$start_gost_command" -L="
# 本地协议
if [ $local_agreement ]; then
    start_gost_command=$start_gost_command$local_agreement"://"
fi
# 本地用户名和密码
if [ $local_username ] && [ $local_password ]; then
    start_gost_command=$start_gost_command$local_username":"$local_password"@"
fi
# 本地 IP 地址
if [ $local_host ]; then
    start_gost_command=$start_gost_command$local_host
fi
# 本地端口
if [ $local_port ]; then
    start_gost_command=$start_gost_command":"$local_port
fi
# === 代理 ===
start_gost_command=$start_gost_command" -F="
# 代理协议
if [ $proxy_agreement ]; then
    start_gost_command=$start_gost_command$proxy_agreement"://"
fi
# 代理用户名和密码
if [ $proxy_username ] && [ $proxy_password ]; then
    start_gost_command=$start_gost_command$proxy_username":"$proxy_password"@"
fi
# 代理 IP 地址
if [ $proxy_host ]; then
    start_gost_command=$start_gost_command$proxy_host
fi
# 代理端口
if [ $proxy_port ]; then
    start_gost_command=$start_gost_command":"$proxy_port
fi
# 结束
start_gost_command=$start_gost_command" >/dev/null 2>&1 &"

# 最终命令
echo "GOST 启动命令："$start_gost_command

exec $start_gost_command