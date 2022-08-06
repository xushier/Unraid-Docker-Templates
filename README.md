# 自用 Unraid Nas 容器安装模板获取脚本

- 模板内置另外一个项目的高清图标。图标项目地址：[HD-Icons](https://github.com/xushier/HD-Icons)  [HD-Icons](https://hub.fastgit.xyz/xushier/HD-Icons)
- 脚本会将图标下载到`/boot/config/HD-Icons/`并将容器图标替换。

# 使用方法
在 unraid 命令行 Ctrl+Shift+V 粘贴以下内容：
```
curl -#O https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```

如果没有梯子的话使用加速地址：
```
curl -#O https://ghproxy.com/https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```
或者镜像地址：
```
curl -#O https://raw.fastgit.org/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```
根据提示选择对应的模板，完成之后在 Unraid Docker 界面添加容器，找到并选择模板，根据实际需要修改部分参数即可。

# 脚本更新
- 传入参数 2 更新脚本：`sh choices.sh 2`
- 传入参数 1 使用镜像地址：`sh choices.sh 1`

# 当前可用容器模板

|模板|模板|模板|模板|模板|模板|模板|模板|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|**Qbittorrent**|**Transmission**|**Aria2**|**115网盘**|**百度网盘**|**阿里云盘**|**Alist**|**Filebrowser**|
|80x86|||||||80x86|
|Linuxserver|||||||官方版|
|Nevinee||||||||
|EnhancedEdition||||||||
|ChisBread||||||||
