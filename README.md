> 简单易用的多平台文件同步软件，惊人的传输速度是不同于其他产品的最大优势， 微力同步 的智能 P2P 技术加速同步，会将文件分割成若干份仅 KB 的数据同步，而文件都会进行 AES 加密处理。

- 官网：http://verysync.com/
- 论坛：http://forum.verysync.com/forum.php
- QQ群号: 530209771

# change log

> 2025年04月11日

- 采用 CI 打包镜像
- 增加 docker 离线镜像

---

## 简单使用

`docker run --name verysync  -d -p 8886:8886 jonnyan404/verysync`

- 打开 http://IP:8886 即可访问.

## 进阶使用
**自定义端口**

`docker run --name verysync  -d -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp -p xxx:xxx -e PORT=yyy -p yyy:yyy jonnyan404/verysync`



- 3000 为默认公共中继端口-(**可选**)
- 22027/22037 为内网udp发现端口-(**可选**)
- xxx 数据传输端口(默认22330)-(**可选**)
- yyy web管理页面端口(默认8886)-(**必须**)

**挂载配置与数据目录**

`docker run --name verysync  -d -v /path/you/dir:/data -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp -p xxx:xxx -e PORT=yyy -p yyy:yyy jonnyan404/verysync`



- /path/you/dir  替换为你自己的目录(可执行创建命令 mkdir -p /path/you/dir)
- 在web界面指定下载目录为 `/data` 即可下载数据到宿主机的 `/path/you/dir` 目录.

**以 no-root 用户运行**

从 2.16.x 版本开始,
如需自定义用户,请自行定义变量 `VUID` 的值(此值必须为Linux系统已存在的UID值).

## 离线镜像下载

在 [Releases](https://github.com/jonnyan404/verysync/releases) 页面可以下载各个架构的离线 Docker 镜像。提供了以下架构的镜像：

- AMD64 (x86_64): 适用于大多数桌面电脑、服务器
- ARM64 (aarch64): 适用于树莓派 4/5、M1/M2 Mac、部分 ARM 服务器
- ARMv7: 适用于树莓派 2/3、部分老旧 ARM 设备

### 离线镜像使用方法

1. 下载对应架构的镜像压缩包
2. 使用以下命令导入镜像：

```bash
# 解压并导入镜像
gunzip -c verysync-docker-*.tar.gz | docker load

# 例如：
gunzip -c verysync-docker-v2.20.1-amd64.tar.gz | docker load
```

3. 导入完成后，即可正常使用：

```bash
# 查看导入的镜像
docker images | grep verysync

# 运行容器
docker run --name verysync -d -p 8886:8886 jonnyan404/verysync:v2.20.1
```