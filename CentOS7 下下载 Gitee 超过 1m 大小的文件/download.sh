#!/bin/bash
# 作者：Rabbir

# Gitee 文件路径
file_url=$1

# 通过 git clone 到本地之后再从对应目录中取出文件的方法绕过 Gitee 下载文件大小的限制
yum -y install git

echo "开始准备拷贝项目......"
# 获取仓库名
array=(${file_url//// })
repository_name=${array[3]}
# 文件名
file_name=${array[-1]}
# 仓库地址
array=(${file_url//raw/ })
repository_url=${array[0]}
# 文件路径（替换掉 /main）
temp_file_path="temp_4_clone/"$repository_name${array[1]///main/}
echo "仓库名：" $repository_name " 仓库地址：" $repository_url

# 创建临时文件夹并拷贝项目
rm -rf temp_4_clone
mkdir temp_4_clone
cd temp_4_clone
git clone $repository_url
echo "项目拷贝成功！开始复制文件......"

# 复制文件
cd ..
echo "文件名：" $file_name "拷贝源文件路径：" $temp_file_path
cp $temp_file_path $file_name

# 删除临时文件夹
echo "拷贝完成，开始删除克隆用临时文件夹......"
rm -rf temp_4_clone

# 完成
echo "下载完成"