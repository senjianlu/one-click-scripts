#!/bin/bash
# 作者：Rabbir

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 下载 Redis 安装包
redis_tar_gz_url=https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/Redis/redis-6.2.6.tar.gz
if [[ ${origin} == *"github"* ]];
then
    wget $redis_tar_gz_url
else
    curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%8B%E8%BD%BD%20Gitee%20%E8%B6%85%E8%BF%87%201%20MB%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%96%87%E4%BB%B6/download.sh | bash -s $redis_tar_gz_url
fi

# 安装 Redis
tar xzf redis-6.2.6.tar.gz
cd redis-6.2.6
make && make install

# 创建初始化脚本
cp utils/redis_init_script /etc/init.d/redis_6379

# 创建 Redis 持久化文件存放目录
mkdir -p /var/redis/6379

# Redis 配置文件，文件目录为：/etc/redis/端口号.conf（除了持久化文件目录外所有路径均为 redis_init_script 官方初始化脚本中的默认路径）
mkdir /etc/redis
mv redis.conf /etc/redis/6379.conf
# 在后台以守护进程模式运行
sed -i 's/daemonize no/daemonize yes/;' /etc/redis/6379.conf
# 修改持久化目录
sed -i 's#dir ./#dir /var/redis/6379#;' /etc/redis/6379.conf

# 删除压缩包
cd ..
rm -rf redis-6.2.6.tar.gz

# 启动 Redis（默认不直接启动，请自行在 Dockerfile 中添加启动命令）
# /etc/init.d/redis_6379 start