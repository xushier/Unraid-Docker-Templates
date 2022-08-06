#!/bin/bash

declare -A container template icon
xdtx_icon_dir="/boot/config/HD-Icons"
xdtx_template_dir="/boot/config/plugins/dockerMan/templates-user"
raw_domain="https://raw.githubusercontent.com"
raw_mirror="https://raw.fastgit.org"

if [[ $1 == 1 ]];then domain=$raw_mirror;echo -e "\n使用 Github 镜像加速地址\n";else domain=$raw_domain;fi
if [[ $1 == 2 ]];then curl -#O https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main/choices.sh > choices.sh;fi

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
[12]="【青龙面板】青龙面板 官方版" \
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
[12]="Qinglong_B" \
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
[12]="Qinglong_B" \
)

str=$'\n'
hr="\n------------------------------------------\n"

echo -e "\n开始执行$hr"
echo -e "传入参数 1，使用镜像地址。例：sh choices.sh 1\n传入参数 2，更新脚本。例：sh choices.sh 2"

while :
do
	echo -e "$hr"
	for key in $(seq ${#container[@]})
	do
	    echo "$key : ${container[$key]}"
	done
	echo -e "$hr"
    
	read -p "请选择模板序号（1到${#container[@]}，回车直接退出）：" container_num

	if test x$container_num = x$str;then
		echo -e "\n手动退出......"
		break
	fi

	if [[ "$container_num" =~ [0-9]+ ]];then
		if [ $container_num -gt ${#container_edition[@]} ] > /dev/null 2>&1;then
			echo -e "\n请输入正确的模板序号！"
			continue
		fi
	else
		echo -e "\n输入错误，请重新选择！"
		continue
	fi

	read -p "$str你选择的是：${container[$container_num]}，确定吗?（是输入 y，否输入 n，回车直接退出）" conf

	if [[ "$conf" =~ [Yy]+[Ee]?[Ss]? ]];then
		mkdir -p $xdtx_icon_dir && \
		cd $xdtx_icon_dir && \
		echo -e "$hr开始下载图标文件\n路径 $xdtx_icon_dir/${icon[$container_num]}.png\n" && \
		curl -#O "$domain/xushier/HD-Icons/main/border-radius/${icon[$container_num]}.png" && \
		echo -e "\n图标下载完毕。$hr"

		cd $xdtx_template_dir && \
		echo -e "$hr开始下载模板文件\n路径 $xdtx_template_dir/my-${template[$container_num]}.xml\n" && \
		curl -#O "$domain/xushier/my-unraid-docker-templates/main/templates/my-${template[$container_num]}.xml" && \
		sed -i "s/<Icon>.*<\/Icon>/<Icon>${xdtx_icon_dir//\//\\\/}\/${icon[$container_num]}.png<\/Icon>/g" "$xdtx_template_dir/my-${template[$container_num]}.xml" && \
		echo -e "\n模板文件下载完毕。在容器界面点击添加容器，选择该模板即可。$hr"

		if [[ $container_num -eq 1 ]];then
			mkdir -p /mnt/user/appdata/Qbittorrent_80x86/config && cd $_
			curl -#s qBittorrent.conf "$domain/xushier/my-unraid-docker-templates/main/templates/${template[$container_num]}.conf"
		fi

		echo -e "$hr图标库：https://github.com/xushier/HD-Icons\n公众号：小迪同学\n B 站：煦诗儿$hr"
		break
	fi

	if [[ "$conf" =~ [Nn]+[Oo]? ]];then
		echo -e "\n )~!~( 这都能输错，小迪一脸嫌弃 )~!~(\n"
		continue
	fi

	if test x$conf = x$str;then
		echo -e "\n手动退出......"
		break
	fi

	echo -e "\n输入错误，请重新选择！"
	continue
done
