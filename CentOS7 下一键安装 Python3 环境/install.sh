#!/bin/bash
# 原作者：20th
# 原脚本链接：https://github.com/clcc2019/install_python3/blob/master/py.sh

# 判断服务器是否在境内以使用不同源
origin=$(curl -s https://raw.githubusercontent.com/senjianlu/one-click-scripts/main/CentOS7%20%E4%B8%8B%E5%88%A4%E6%96%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%98%AF%E5%90%A6%E5%9C%A8%E5%A2%83%E5%86%85%E4%BB%A5%E4%BD%BF%E7%94%A8%E4%B8%8D%E5%90%8C%E6%BA%90/origin-check.sh | bash)

# 默认安装 Python3.8.2
# 路径为：/usr/local/python3
version="3.8.2"
echo "自动安装 Python3.8.2 开始......"
# 安装环境包
yum -y install zlib zlib-devel bzip2 bzip2-devel ncurses ncurses-devel readline readline-devel openssl openssl-devel openssl-static xz lzma xz-devel sqlite sqlite-devel
yum -y install gdbm gdbm-devel
yum -y install tk tk-devel
yum -y install libffi libffi-devel
yum -y install zlib* libffi-devel
yum install gcc* glien* -y
# 下载、解压和安装
if [[ $origin == *"github"* ]];
then
    wget https://$origin.com/senjianlu/one-click-scripts/raw/main/mirror/Python/3/Python-$version.tgz
else
    echo "暂时没有国内源！"
fi
tar -xvf Python-$version.tgz && mkdir /usr/local/python3 && cd Python-$version
./configure --prefix=/usr/local/python3 && make && make install
if test $[python3 -V]==0; then echo '安装成功'; else echo'安装出错！';fi
# 设置软连接
ln -f /usr/local/python3/bin/python3.8 /usr/bin/python3
ln -f /usr/local/python3/bin/pip3.8 /usr/bin/pip3
PATH=$PATH:/usr/bin/python3
echo "安装完成"
read -p "回车查看版本" V
python3 -V