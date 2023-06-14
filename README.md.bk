# Unraid Nas 容器安装模板获取脚本

1. 模板内置另外一个项目的高清图标。
2. 图标项目地址：[HD-Icons](https://github.com/xushier/HD-Icons)  若打不开访问加速地址：[HD-Icons](https://cdn.jsdelivr.net/gh/xushier/HD-Icons/)
3. 更新：图标使用加速代理地址，无需再下载。

# 使用方法
## 单容器
第一次使用，在 unraid 命令行 Ctrl+Shift+V 粘贴以下内容下载脚本：
```
curl -#O https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```

如果没有梯子的话使用加速地址：
```
curl -#O https://ghproxy.com/https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```
**下载完后脚本会自动运行，然后根据提示选择对应的模板，完成之后在 Unraid Docker 界面添加容器，找到并选择模板，根据实际需要修改部分参数即可。**

**注意：模板需修改的一般是路径和端口。若修改端口和网络模式，对应 WEBUI 端口也需要修改（非必须）。**

后续下载模板时，因为脚本已经下载，在终端命令行同目录执行 `sh choices.sh` 即可。
## 多容器

第一次使用，在 unraid 命令行 Ctrl+Shift+V 粘贴以下内容下载脚本：
```
curl -#O https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/compose.sh && sh compose.sh
```

如果没有梯子的话使用加速地址：
```
curl -#O https://ghproxy.com/https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/compose.sh && sh compose.sh
```
下载完后脚本会自动运行。

- **多容器模板需要配合使用 `compose.manager` 插件来安装，脚本运行时会先检测插件是否安装。**

- **若安装，根据提示选择对应的模板，会继续进行后续的模板下载，完成之后在 Unraid `compose.manager` 界面对应的容器就已经出现，点击 `COMPOSE UP` 按钮，等待自动拉取镜像、安装启动即可。**

- **若未安装，则会自动退出脚本。安装方法：在 Unraid 应用商店搜索 `compose.manager` 安装。**

- **若需修改端口或目录，点击容器名称，点击 `EDIT STACK` > `COMPOSE FILE` 进入编辑；**

- **若需修改 `WEBUI` 或图标地址，点击容器名称，点击 `EDIT STACK` > `UI LABELS` 进入编辑；**

后续下载模板时，在终端命令行同目录执行 `sh compose.sh` 即可。

# 脚本更新
- 传入参数 2 更新脚本：`sh choices.sh 2`
- 传入参数 1 使用镜像地址：`sh choices.sh 1`

# 当前可用容器模板

|模板|模板|模板|模板|模板|模板|模板|模板|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|**Qbittorrent**|**Transmission**|**Aria2**|**115网盘**|**百度网盘**|**阿里云盘**|**Alist**|**Filebrowser**|
|80x86|ChisBread|oldiy||Johngong||官方版|80x86|
|Linuxserver|Linuxserver||||||官方版|
|Nevinee||||||||
|EnhancedEdition||||||||
|ChisBread||||||||
|**Snap2Html**|**IYUU-Plus**|**KoodoReader**|**Clash**|**CodeServer**|**Draw.io**|**Composerize**|**AliyunWebdav**|
|321661|官方版|xushier|dreamacro|官方版|官方版|官方版|messense|
