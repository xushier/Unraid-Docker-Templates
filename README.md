# Unraid Nas 的一些容器安装模板

- 模板内置另外一个项目的高清图标。
- 脚本会将图标下载到`/boot/config/HD-Icons/`并将容器图标替换。
- 图标项目地址：[HD-Icons](https://github.com/xushier/HD-Icons)

# 使用方法
在 unraid 命令行执行：
```
wget -qN https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```

或者没有梯子的话使用镜像地址：
```
wget -qN https://raw.fastgit.org/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```
根据序号选择对应的模板，完成之后在 Unraid Docker 界面添加容器，找到并选择模板，根据实际需要修改部分参数即可。

# 当前可用容器模板

|模板|模板|模板|模板|模板|模板|模板|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|**Qbittorrent**|**Transmission**|**Aria2**|**115网盘**|**百度网盘**|**阿里云盘**|Alist|
|80x86|2|百度网盘|1|Bark|1|Bitwarden|1|
|Linuxserver|1|Chrome|1|Docker|1|Draw.io|1|
|Nvinee|1|EpicGames|1|FileBrowser|1|FreshRSS|2|
|EnhancedEdition|4|IYUU|1|Jellyfin|2|可道云|1|
|Koodo Reader|1|Kutt|1|Lomorage|1|MariaDB|2|
