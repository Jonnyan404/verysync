> 简单易用的多平台文件同步软件，惊人的传输速度是不同于其他产品的最大优势， 微力同步 的智能 P2P 技术加速同步，会将文件分割成若干份仅 KB 的数据同步，而文件都会进行 AES 加密处理。

- 官网：http://verysync.com/
- 论坛：http://forum.verysync.com/forum.php
- Telegram: https://t.me/verysync
- QQ群号: 530209771

### 使用问题：QQ群 @亖 | telegram @jonnyan

---

## 简单使用

`docker run --name verysync  -d -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp  -p 22330:22330 -p 8886:8886 jonnyan404/verysync`

- 打开 http://IP:8886 即可访问.

## 进阶使用
**自定义端口**

`docker run --name verysync  -d -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp -p xxx:xxx -e PORT=yyy -p yyy:yyy jonnyan404/verysync`

例(默认):`docker run --name verysync  -d -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp -p 22330:22330 -e PORT=8886 -p 8886:8886 jonnyan404/verysync`

- 3000 为默认公共中继端口-(**可选**)
- 22027/22037 为内网udp发现端口-(**可选**)
- xxx 数据传输端口(默认22330)-(**可选**)
- yyy web管理页面端口(默认8886)-(**必须**)

**挂载配置与数据目录**

`docker run --name verysync  -d -v /path/you/dir:/data -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp -p xxx:xxx -e PORT=yyy -p yyy:yyy jonnyan404/verysync`

例(默认):`docker run --name verysync  -d -v /opt/verysync:/data -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp -p 22330:22330 -e PORT=8886 -p 8886:8886 jonnyan404/verysync`

- /path/you/dir  替换为你自己的目录(可执行创建命令 mkdir -p /path/you/dir)
- 在web界面指定下载目录为 `/data` 即可下载数据到宿主机的 `/path/you/dir` 目录.

**以 no-root 用户运行**

此步仅限有一定 linux 知识和 docker 知识的用户选择.
在 docker run 命令后,追加 `--user UID:GID` 来指定运行用户和用户组.
