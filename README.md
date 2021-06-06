# one-click-scripts
自用一键脚本

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