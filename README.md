# Unraid Nas 的一些容器安装模板

- 模板内置另外一个项目的高清图标。
- 脚本会将图标下载到`/boot/config/HD-Icons/`并将容器图标替换。
- 图标项目地址：[HD-Icons](https://github.com/xushier/HD-Icons)

例：

QB 模板下载，在 unraid 命令行执行：
```
wget -qN https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```

或者没有梯子的话使用镜像地址：
```
wget -qN https://raw.fastgit.org/xushier/Unraid-Docker-Templates/main/choices.sh && sh choices.sh
```

完毕之后在 Unraid 界面添加容器，找到模板，修改下载目录即可。
