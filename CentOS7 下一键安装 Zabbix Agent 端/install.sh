#!/bin/bash

# 参数和其说明（server 端端口默认 10051，agent 端默认 10050）
server_host=$1
agent_host_name=$2
agent_port=10050

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 开放指定端口
opened_port=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%BC%80%E5%90%AF%E9%98%B2%E7%81%AB%E5%A2%99%E6%8C%87%E5%AE%9A%E7%AB%AF%E5%8F%A3/open-port.sh | bash -s $agent_port)

# 下载并安装
wget https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/Zabbix/Agent/zabbix-agent-4.0.9-3.el7.x86_64.rpm
yum -y install zabbix-agent-4.0.9-3.el7.x86_64.rpm

# 更改配置文件
sed -i "s/Hostname=Agent Server/Hostname=$agent_host_name" /etc/zabbix/zabbix_agentd.conf
sed -i "s/Server=127.0.0.1/Hostname=$server_host" /etc/zabbix/zabbix_agentd.conf
sed -i "s/ServerActive=127.0.0.1/Hostname=$server_host" /etc/zabbix/zabbix_agentd.conf

# 开机启动
systemctl enable zabbix-agent.service

# 启动
systemctl start zabbix-agent.service