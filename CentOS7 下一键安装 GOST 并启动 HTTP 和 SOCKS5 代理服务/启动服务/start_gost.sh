#!/bin/bash
# GOST 启动脚本增强版

ARGS=`getopt -a -l local_username:,local_password:,local_host::,local_port:,proxy_username::,proxy_password::,proxy_host:,proxy_port: -n 'start_gost.sh' -- "$@"`

if [ $? != 0 ];then
        echo "Terminating..."
        exit 1
fi

eval set -- "${ARGS}"

while :
do
    case $1 in
        -a|--local_username)
            shift;
            local_username=$2
            ;;
        --local_password)
            shift;
            local_password=$2
            ;;
        --local_host)
            shift;
            local_host=$2
            ;;
        --local_port)
            shift;
            local_port=$2
            ;;
        --)
            shift;
            break;
            ;;
        *)
            echo "Internal error!"
            exit 1
            ;;
    esac
shift
done

# local_username=$1
# local_password=$2
# local_host=$3
# local_port=$3
# proxy_username=
# proxy_password=
# proxy_host=$4
# proxy_port=$5

# nohup gost -L $gost_username:$gost_password@:$gost_port -F=socks5://$proxy_host:$proxy_port >/dev/null 2>&1 &