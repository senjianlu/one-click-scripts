#!/bin/bash
# 原作者：20th
# 原脚本链接：https://github.com/clcc2019/install_python3/blob/master/py.sh

# 获取脚本执行的绝对路径
work_path=$(dirname $(readlink -f $0))

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 默认安装 Python3.8.2
# 路径为：/usr/local/python3
version="3.8.2"
echo "自动安装 Python-3.8.2 开始......"
# 安装环境包
yum -y install zlib zlib-devel bzip2 bzip2-devel ncurses ncurses-devel readline readline-devel openssl openssl-devel openssl-static xz lzma xz-devel sqlite sqlite-devel
yum -y install gdbm gdbm-devel
yum -y install tk tk-devel
yum -y install libffi libffi-devel
yum -y install zlib* libffi-devel
yum install gcc* glien* -y
# 下载、解压和安装
if [[ ${origin} == *"github"* ]];
then
    yum -y install wget
    wget https://github.com/senjianlu/one-click-scripts/raw/main/mirror/Python/3/Python-$version.tgz
else
    # todo...

tar -xvf Python-$version.tgz
mkdir /usr/local/python3
cd Python-$version
./configure --prefix=/usr/local/python3 && make && make install
# 设置软连接
ln -f /usr/local/python3/bin/python3.8 /usr/bin/python3
ln -f /usr/local/python3/bin/pip3.8 /usr/bin/pip3
# 验证 Python3 是否安装成功
if test -z $(python3 -V)
then
    echo "安装出错！已保留 Python3 安装所需文件，请手动调试安装排查错误！"
    echo "1、确认脚本所在路径是否有类似 Python-3.8.2.tgz 的压缩包和解压文件夹。"
    echo "2、再去 /usr/local 路径下确认是否有名为：python3 的文件夹，那里是最终 Python3 环境的安装所在目录。"
else
    echo "安装成功！开始删除 Python3 安装所用的文件......"
    # 删除 Python3 压缩包和解压出的文件夹
    rm -f Python-$version.tgz
    rm -rf Python-$version
    PATH=$PATH:/usr/bin/python3
    echo "安装完成！"
    read -p "回车查看版本！" V
    python3 -V
fi