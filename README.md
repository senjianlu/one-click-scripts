# one-click-scripts

## 项目功能
方便自己开发和生产环境中的环境部署。  

## 优势
1. 几乎所有的脚本都由我手写完成，代码格式和软件的安装目录较为统一。
2. 所有脚本都经过测试（你可以在目录处查看该脚本的测试记录）。
3. 安装包都在 [/mirror](https://github.com/senjianlu/one-click-scripts/tree/main/mirror) 目录下拥有备份，这意味着即使原仓库删除对脚本的运行也不会产生影响。
4. 同时在 [GitHub](https://github.com/senjianlu/one-click-scripts) 和 [Gitee](https://gitee.com/senjianlu/one-click-scripts) 都拥有仓库，境内服务器安装会优先从 Gitee 仓库下载。  

## 注意
如果你希望自己 Fork 后的仓库也能自动同步到 Gitee ，请在你自己的仓库 Settings → Secrets 处添加你 Gitee 仓库的 $GITEE_TOKEN 和 $SSH_PRIVATE_KEY，并将 [.github/workflows/sync.yml](https://github.com/senjianlu/one-click-scripts/blob/main/.github/workflows/sync.yml) 的第 [37](https://github.com/senjianlu/one-click-scripts/blob/main/.github/workflows/sync.yml#L37) 行和第 [39](https://github.com/senjianlu/one-click-scripts/blob/main/.github/workflows/sync.yml#L39) 行修改为你的 Gitee 仓库地址。  

## 脚本目录
**考虑到即使是同一脚本、各人使用的目的也可能不同，不再进行脚本归类，请 `Ctrl` + `F` 通过关键词查找。**
***

#### [CentOS7 下一键开启防火墙指定端口](https://github.com/senjianlu/one-click-scripts/blob/main/CentOS7%20下一键开启防火墙指定端口)  
1、一键开启：  
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键开启防火墙指定端口/open-port.sh | bash -s $port
```
2、参数说明：  
| 参数 | 说明 | 样例 |  
| --- | ---- | --- |  
| port | 【必填】开放的端口。 | 1080 |  
***

#### [CentOS7 下一键安装 Nginx 反代指定网站](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20Nginx%20反代指定网站)
1、一键安装：  
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20Nginx%20反代指定网站/install.sh | bash -s $nginx_reverse_port $nginx_reverse_domain_my $nginx_reverse_domain_it
```
2、参数说明：  
| 参数 | 说明 | 样例 |  
| --- | ---- | --- |  
| nginx_reverse_port | 【必填】你域名的端口。 | 80 |  
| nginx_reverse_domain_my | 【必填】你的域名。 | my_web.com |  
| nginx_reverse_domain_it | 【必填】目标域名。 | its_web.com |  

3、备注：
+ Nginx 配置文件所在目录：/etc/nginx/nginx.conf
***

#### [CentOS7 下一键安装 Python3 环境](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20Python3%20环境)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20Python3%20环境/install.sh | bash
```  
2、备注：  
+ Python3 所在目录：/usr/local/python3
***

#### [CentOS7 下一键安装 SOCKS5 代理](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20SOCKS5%20代理)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20SOCKS5%20代理/install.sh | bash -s $ss5_port $ss5_username $ss5_password
```
2、参数说明：  
| 参数 | 说明 | 样例 |  
| --- | ---- | --- |  
| ss5_port | 【必填】SOCKS5 代理服务所在端口。 | 1080 |  
| ss5_username | 【必填】SOCKS5 代理认证用户名。 | my_user |  
| ss5_password | 【必填】SOCKS5 代理认证密码。 | my_pass |  
***

#### [CentOS7 下一键安装 Clash 客户端](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20Clash%20客户端)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20Clash%20客户端/install.sh | bash
```
2、备注：
+ Clash 安装完成后只有一个可执行文件，路径为：/usr/local/bin/clash
+ 在第一次运行时，会在 ~/.config/clash/ 目录下创建 config.yaml 和 Country.mmdb 这两个默认使用的配置文件
+ 通过在运行时添加 `-f $config_file_path` 参数，你可以指定 Clash 使用哪个配置文件
***

#### [CentOS7 下一键安装 Shadowsocks 客户端](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20Shadowsocks%20客户端)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20Shadowsocks%20客户端/install.sh | bash
```
2、备注：
+ 客户端和服务器端一体
+ Shadowsocks 客户端所在目录：/usr/local/share/shadowsocks
+ 控制脚本所在目录：/usr/local/bin/ssr
***

#### [CentOS7 下一键安装 Shadowsocks-libev 客户端（使用 SS 节点并支持 chacha20-ietf-poly1305 加密）](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20Shadowsocks-libev%20客户端%EF%BC%88使用%20SS%20节点并支持%20chacha20-ietf-poly1305%20加密%EF%BC%89)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20Shadowsocks-libev%20客户端%EF%BC%88使用%20SS%20节点并支持%20chacha20-ietf-poly1305%20加密%EF%BC%89/install.sh | bash
```
2、备注：
+ 客户端和服务器端一体
+ ~~意义不明的脚本，我已经不记得用途了~~
***

#### [CentOS7 下一键安装 Tinyproxy 代理](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20Tinyproxy%20代理)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20Tinyproxy%20代理/install.sh | bash -s $tinyproxy_port $tinyproxy_username $tinyproxy_password
```
2、参数说明：  
| 参数 | 说明 | 样例 |  
| --- | ---- | --- |  
| tinyproxy_port | 【必填】HTTP 代理服务所在端口。 | 1081 |  
| tinyproxy_username | 【必填】HTTP 代理认证用户名。 | my_user |  
| tinyproxy_password | 【必填】HTTP 代理认证密码。 | my_pass |  

3、备注：
+ Shadowsocks 客户端所在目录：/usr/local/share/tinyproxy-1.11.0-rc1
***

#### [CentOS7 下下载 Gitee 超过 1 MB 大小的文件](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下下载%20Gitee%20超过%201%20MB%20大小的文件)
1、一键下载：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下下载%20Gitee%20超过%201%20MB%20大小的文件/download.sh | bash -s $gitee_file_url$gitee_file_url
```
2、参数说明：
| 参数 | 说明 | 样例 |  
| --- | ---- | --- |  
| gitee_file_url | 【必填】Gitee 仓库中文件的下载链接。 | https://gitee.com/senjianlu/one-click-scripts/raw/main/mirror/Python/3/Python-3.8.2.tgz |  

3、备注：
+ 文件会被下载至当前目录下
***

#### [CentOS7 下一键安装 GOST 并启动 HTTP 和 SOCKS5 代理服务](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20GOST%20并启动%20HTTP%20和%20SOCKS5%20代理服务)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20GOST%20并启动%20HTTP%20和%20SOCKS5%20代理服务/install.sh | bash -s $proxy_port $proxy_username $proxy_password
```
2、参数说明：
| 参数 | 说明 | 样例 |  
| --- | ---- | --- |  
| proxy_port | 【选填】HTTP&SOCKS5 代理服务共同所在端口。 | 1082 |  
| proxy_username | 【选填】HTTP&SOCKS5 代理共同认证用户名。 | my_user |  
| proxy_password | 【选填】HTTP&SOCKS5 代理共同认证密码。 | my_pass |  

3、备注：
+ 3 个参数中只要有 1 个没有填写，GOST 服务就不会启动
+ GOST 安装完成后只有一个可执行文件，路径为：/usr/bin/gost

> Linux 下测试代理命令：
> ```bash
> # HTTP 代理
> curl -x http://$username:$password@$host:$port http://ip-api.com/json/?lang=zh-CN  
> # SOCKS5 代理
> curl -x socks5://$username:$password@$host:$port http://ip-api.com/json/?lang=zh-CN  
> ```
***

#### [CentOS7 下一键安装 libsodium 加密库](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20libsodium%20加密库)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20libsodium%20加密库/install.sh | bash
```
2、备注：
+ ~~依旧是意义不明的脚本~~
+ CentOS7 下你可以通过 `yum install libsodium libsodium-devel` 进行安装，而不需要使用本脚本
***

#### [CentOS7 下一键安装 Zabbix Agent 端](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20Zabbix%20Agent%20端)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20Zabbix%20Agent%20端/install.sh | bash -s $server_host $agent_host_name
```
2、参数说明：
| 参数 | 说明 | 样例 |  
| --- | ---- | --- |  
| server_host | 【必填】Zabbix server 端所在地址。 | server_node.zabbix.com |  
| agent_host_name | 【必填】该 Agent 节点的名字。 | test_node_01 | 
***

#### [CentOS7 下一键为 OpenVZ  架构服务器添加 SWaP 分区](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键为%20OpenVZ%20%20架构服务器添加%20SWaP%20分区)
1、一键添加：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键为%20OpenVZ%20%20架构服务器添加%20SWaP%20分区/add.sh | bash
```
2、备注：
+ 最大添加 512 MB 内存
***

#### [CentOS7 下一键安装 Chrome 和 chromedriver](https://github.com/senjianlu/one-click-scripts/tree/main/CentOS7%20下一键安装%20Chrome%20和%20chromedriver)
1、一键安装：
```bash
curl -s https://gitee.com/senjianlu/one-click-scripts/raw/main/CentOS7%20下一键安装%20Chrome%20和%20chromedriver/install.sh | bash
```
2、备注：
+ chromedriver 所在路径：/usr/bin/chromedriver
***

## 特别鸣谢
- 感谢 [HostVDS](https://hostvds.com/) 为本项目提供测试用服务器