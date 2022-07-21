#!/bin/bash

declare -A container
declare -A template
declare -A icon

xdtx_icon_dir="/boot/config/HD-Icons/border-radius"
xdtx_template_dir="/boot/config/plugins/dockerMan/templates-user"
raw_domain="https://raw.githubusercontent.com"
raw_mirror="https://raw.fastgit.org"

container=(\
[1]="QB_80x86 荒野无灯版" \
[2]="QB_Linuxserver 版" \
[3]="QB_NVEE 多功能版" \
[4]="QB_快检版" \
[5]="QB_EE BT增强版" \
[6]="TR_LinuxServer 版" \
[7]="TR 快检版" \
[8]="Aria2NG 下载器" \
[9]="Vaultwarden SQLite版" \
[10]="Filebrowser_80x86 荒野无灯版" \
[11]="Filebrowser_80x86 荒野无灯版" \
)

template=(\
[1]="Qbittorrent_80x86" \
[2]="Qbittorrent_LS" \
[3]="Qbittorrent_NVEE" \
[4]="Qbittorrent_CB" \
[5]="Qbittorrent_EE" \
[6]="TR_LinuxServer 版" \
[7]="TR 快检版" \
[8]="Aria2NG 下载器" \
[9]="Vaultwarden SQLite版" \
[10]="Filebrowser_80x86 荒野无灯版"\
)

icon=(\
[1]="Qbittorrent_A" \
[2]="Qbittorrent_A" \
[3]="Qbittorrent_A" \
[4]="Qbittorrent_A" \
[5]="Qbittorrent_B" \
[6]="TR_LinuxServer 版" \
[7]="TR 快检版" \
[8]="Aria2NG 下载器" \
[9]="Vaultwarden SQLite版" \
[10]="Filebrowser_80x86 荒野无灯版"\
)

while :
do
	for key in $(seq ${#container[@]})
	do
	    echo "$key : ${container[$key]}"
	done
	
	str=$'\n'
    
	read -p "$str请选择模板序号（1到${#container[@]}，回车直接退出）：" container_num
	if [ $container_num == $str ];then
		echo -e "\n手动退出......"
		break
	fi

	read -p "$str你选择的是：${container[$container_num]}，确定吗?（是输入 y，否输入 n，回车直接退出）" conf
	if [ $conf == "y" ];then
		mkdir -p $xdtx_icon_dir && cd $xdtx_icon_dir && wget -N "$raw_domain/xushier/HD-Icons/main/border-radius/${icon[$container_num]}.png" && echo -e "\n下载完毕。\n路径 $xdtx_icon_dir/${icon[$container_num]}.png\n"
		cd $xdtx_template_dir && wget -N "$raw_domain/xushier/my-unraid-docker-templates/main/docker/my-${template[$container_num]}.xml" && sed -i "s/<Icon>.*<\/Icon>/<Icon>${xdtx_icon_dir//\//\\\/}\/${icon[$container_num]}.png<\/Icon>/g" "$xdtx_template_dir/my-${template[$container_num]}.xml" && echo -e "\n执行完毕。\n图标文件位于 $xdtx_icon_dir\n模板文件位于 $xdtx_template_dir\n在容器界面点击添加容器，选择模板即可。"
		echo -e "\n图标库：https://github.com/xushier/HD-Icons\n公众号：小迪同学\n B 站：煦诗儿\n"
		break
	fi
	if [ $conf == "n" ];then
		echo -e "\n )~!~( 这都能输错，小迪一脸嫌弃 )~!~(\n"
		continue
	fi
	echo -e "\n手动退出......"
	break
done