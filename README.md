> 简单易用的多平台文件同步软件，惊人的传输速度是不同于其他产品的最大优势， 微力同步 的智能 P2P 技术加速同步，会将文件分割成若干份仅 KB 的数据同步，而文件都会进行 AES 加密处理。

- 官网：http://verysync.com/
- 论坛：http://forum.verysync.com/forum.php
- Telegram: https://t.me/verysync
---

## 简单使用

`docker run --name verysync  -d -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp  -p 22330:22330 -p 8886:8886 jonnyan404/verysync`

- 打开 http://IP:8886 即可访问.

## 进阶使用
**自定义端口**

`docker run --name verysync  -d -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp -p xxx:xxx -e PORT=yyy -p yyy:yyy jonnyan404/verysync`

- 3000 为默认公共中继端口
- 22027/22037 为内网udp发现端口
- xxx 数据传输端口(默认22330)
- yyy web管理页面端口(默认8886)

**挂载配置与数据目录**

`docker run --name verysync  -d -v /path/you/dir:/data -p 3000:3000 -p 22037:22037/udp -p 22027:22027/udp -p xxx:xxx -e PORT=yyy -p yyy:yyy jonnyan404/verysync`

- /path/you/dir  替换为你自己的目录(可执行创建命令 mkdir -p /path/you/dir)
- 在web界面指定下载目录为 `/data` 即可下载数据到宿主机的 `/path/you/dir` 目录.

~~**配置更多启动参数**~~
~~- 跟在docker启动参数最后即可.~~

~~```
-allow-newer-config
    	Allow loading newer than current config version (default true)
  -audit
    	Write events to audit file
  -browser-only
    	Open GUI in browser
  -config string
    	Set configuration directory (config and keys)
  -data string
    	Set data directory (database and logs)
  -device-id
    	Show the device ID
  -generate string
    	Generate key and config in specified dir, then exit
  -generate-secret
    	Generate a read/write key
  -gui-address string
    	Override GUI address (e.g. "http://192.168.1.5:8886")
  -help
    	Show this help
  -home string
    	Set configuration and data directory
  -log-max-old-files int
    	Number of old files to keep (zero to keep only current). (default 3)
  -log-max-size int
    	Maximum size of any file (zero to disable log rotation). (default 10485760)
  -logfile string
    	Log file name (see below). (default "-")
  -logflags int
    	Select information in log line prefix (see below) (default 2)
  -no-browser
    	Do not start browser
  -no-restart
    	Do not restart Verysync when exiting due to API/GUI command, upgrade, or crash
  -paths
    	Show configuration paths
  -paused
    	Start with all devices and folders paused
  -reset-database
    	Reset the database, forcing a full rescan and resync
  -reset-deltas
    	Reset delta index IDs, forcing a full index exchange
  -reset-password
    	Reset gui user password
  -service string
    	System service control install, uninstall, start, stop, restart, status
  -service-name string
    	Set service name (default "verysync")
  -service-user string
    	Service run as user
  -unpaused
    	Start with all devices and folders unpaused
  -upgrade
    	Perform upgrade
  -upgrade-check
    	Check for available upgrade
  -upgrade-to string
    	Force upgrade directly from specified URL
  -verbose
    	Print verbose log output
  -version
    	Show version
  -watch-files int
    	Set the maximum number of file watches (default 200000)
```~~
