#!/bin/bash

curl https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/choices.sh > choices.sh

declare -A container template icon
xdtx_icon_dir="/boot/config/HD-Icons"
xdtx_template_dir="/boot/config/plugins/dockerMan/templates-user"
raw_domain="https://raw.githubusercontent.com"
raw_mirror="https://raw.fastgit.org"

if [[ $1 == 1 ]];then domain=$raw_mirror;echo -e "\n使用 Github 镜像加速地址\n";else domain=$raw_domain;fi

container=(\
[1]="【PT 下载器】QB_80x86 荒野无灯版" \
[2]="【PT 下载器】QB_LS 版" \
[3]="【PT 下载器】QB_NVEE 多功能版" \
[4]="【PT 下载器】QB_CB 快检版" \
[5]="【BT 下载器】QB_EE BT增强版" \
[6]="【PT 下载器】TR_LS 版" \
[7]="【PT 下载器】TR_CB 快检版" \
[8]="【BT 下载器】Aria2NG_Oldiy 版" \
[9]="【密码管理器】Vaultwarden_SQLite 版" \
[10]="【文件管理器】Filebrowser_80x86 荒野无灯版" \
[11]="【文件管理器】Filebrowser_OF 官方版" \
)

template=(\
[1]="Qbittorrent_80x86" \
[2]="Qbittorrent_LS" \
[3]="Qbittorrent_NVEE" \
[4]="Qbittorrent_CB" \
[5]="Qbittorrent_EE" \
[6]="Transmission_LS" \
[7]="Transmission_CB" \
[8]="Aria2NG_Oldiy" \
[9]="Vaultwarden_SQLite" \
[10]="Filebrowser_80x86" \
[11]="Filebrowser_OF" \
)

icon=(\
[1]="Qbittorrent_A" \
[2]="Qbittorrent_A" \
[3]="Qbittorrent_A" \
[4]="Qbittorrent_A" \
[5]="Qbittorrent_B" \
[6]="Transmission_A" \
[7]="Transmission_B" \
[8]="AriaNgNative_B" \
[9]="Bitwarden" \
[10]="Filebrowser" \
[11]="Filebrowser" \
)

while :
do
	for key in $(seq ${#container[@]})
	do
	    echo "$key : ${container[$key]}"
	done
	
	str=$'\n'
	hr="\n--------------------------------------------------------------------------------"
    
	read -p "$str请选择模板序号（1到${#container[@]}，回车直接退出）：" container_num
	if [ $container_num == $str ];then
		echo -e "\n手动退出......"
		break
	fi

	read -p "$str你选择的是：${container[$container_num]}，确定吗?（是输入 y，否输入 n，回车直接退出）" conf
	if [[ $conf == "y" ]] || [[ $conf == "Y" ]];then
		mkdir -p $xdtx_icon_dir && cd $xdtx_icon_dir && echo -e "$hr\n开始下载图标文件\n路径 $xdtx_icon_dir/${icon[$container_num]}.png\n" && curl -O "$domain/xushier/HD-Icons/main/border-radius/${icon[$container_num]}.png" && echo -e "\n图标下载完毕。$hr"
		cd $xdtx_template_dir && echo -e "$hr\n开始下载模板文件\n路径 $xdtx_template_dir/my-${template[$container_num]}.xml\n"&& curl -O "$domain/xushier/my-unraid-docker-templates/main/docker/my-${template[$container_num]}.xml" && sed -i "s/<Icon>.*<\/Icon>/<Icon>${xdtx_icon_dir//\//\\\/}\/${icon[$container_num]}.png<\/Icon>/g" "$xdtx_template_dir/my-${template[$container_num]}.xml" && echo -e "\n模板文件下载完毕。在容器界面点击添加容器，选择该模板即可。$hr"
		echo -e "$hr\n图标库：https://github.com/xushier/HD-Icons\n公众号：小迪同学\n B 站：煦诗儿$hr\n"
		break
	fi
	if [[ $conf == "n" ]] || [[ $conf == "N" ]];then
		echo -e "\n )~!~( 这都能输错，小迪一脸嫌弃 )~!~(\n"
		continue
	fi
	echo -e "\n手动退出......"
	break
done
