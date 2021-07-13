# one-click-scripts

## 项目功能
方便自己开发和生产环境中的环境部署。  

## 优势
安装包都在 mirror 目录下拥有备份即使原仓库删除对脚本也不会产生影响，同时在 [GitHub](https://github.com/senjianlu/tiny-server-probe) 和 [Gitee](https://gitee.com/senjianlu/one-click-scripts) 都拥有仓库，境内服务器安装会优先从 Gitee 仓库下载。  

## 注意
Fork 本仓库后请在你自己的仓库 Settings → Secrets 处添加你 Gitee 仓库的 $GITEE_TOKEN 和 $SSH_PRIVATE_KEY，并将 [.github/workflows/sync.yml](https://github.com/senjianlu/one-click-scripts/blob/main/.github/workflows/sync.yml) 的第 [37](https://github.com/senjianlu/one-click-scripts/blob/main/.github/workflows/sync.yml#L37) 行和第 [39](https://github.com/senjianlu/one-click-scripts/blob/main/.github/workflows/sync.yml#L39) 行修改为你的仓库地址。  

## 使用手册
#### CentOS7 下一键开启防火墙指定端口
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%BC%80%E5%90%AF%E9%98%B2%E7%81%AB%E5%A2%99%E6%8C%87%E5%AE%9A%E7%AB%AF%E5%8F%A3/open-port.sh | bash -s $port
```

#### CentOS7 下一键安装 Nginx 反代指定网站
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20Nginx%20%E5%8F%8D%E4%BB%A3%E6%8C%87%E5%AE%9A%E7%BD%91%E7%AB%99/install.sh | bash -s $nginx_reverse_port $nginx_reverse_domain_my $nginx_reverse_domain_it
```

#### CentOS7 下一键安装 Python3 环境
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20Python3%20%E7%8E%AF%E5%A2%83/install.sh | bash
```

#### CentOS7 下一键安装 SOCKS5 代理
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20SOCKS5%20%E4%BB%A3%E7%90%86/install.sh | bash -s $ss5_port $ss5_username $ss5_password
```

#### CentOS7 下一键安装 Shadowsocks 客户端
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20Shadowsocks%20%E5%AE%A2%E6%88%B7%E7%AB%AF/install.sh | bash
```

#### CentOS7 下一键安装 Tinyproxy 代理
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20Tinyproxy%20%E4%BB%A3%E7%90%86/install.sh | bash -s $tinyproxy_port $tinyproxy_username $tinyproxy_password
```

#### CentOS7 下下载 Gitee 超过 1 MB 大小的文件
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%8B%E8%BD%BD%20Gitee%20%E8%B6%85%E8%BF%87%201%20MB%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%96%87%E4%BB%B6/download.sh | bash -s $gitee_file_url
```

#### CentOS7 下一键安装 GOST 隧道中转并配置
```bash
wget --no-check-certificate -O gost.sh https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20GOST%20%E9%9A%A7%E9%81%93%E4%B8%AD%E8%BD%AC%E5%B9%B6%E9%85%8D%E7%BD%AE/gost.sh && chmod +x gost.sh && ./gost.sh
```

#### CentOS7 下一键安装 libsodium 加密库
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20%E4%B8%8B%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%20libsodium%20%E5%8A%A0%E5%AF%86%E5%BA%93/install.sh | bash
```

>测试代理
```bash
curl -x http://$username:$password@$host:$port http://ip-api.com/json/?lang=zh-CN  
curl -x socks5://$username:$password@$host:$port http://ip-api.com/json/?lang=zh-CN  
```