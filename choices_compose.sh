#!/bin/bash

declare -A container template icon

file=("autostart" "name" "description" "docker-compose.yml" "docker-compose.override.yml" ".env")
xdtx_template_dir="/boot/config/plugins/compose.manager/projects"
raw_domain="https://raw.githubusercontent.com"
raw_mirror="https://ghproxy.com/$raw_domain"

if [[ $1 == 1 ]];then domain=$raw_mirror;echo -e "\n使用 Github 镜像加速地址\n";else domain=$raw_domain;fi
if [[ $1 == 2 ]];then curl $raw_mirror/xushier/Unraid-Docker-Templates/main/choices.sh > choices.sh;fi

container=(\
[1]="【密码管理器】Vaultwarden_Compose 版" \
)

template=(\
[1]="Vaultwarden_Compose" \
)

icon=(\
[1]="Bitwarden" \
)




mkdir -p $xdtx_template_dir/$container_name && cd $xdtx_template_dir/$container_name
for f in ${file}
do
	curl -O "$domain/xushier/Unraid-Docker-Templates/main/${template[$container_num]}/$f"
done



xdtx_icon_dir="/boot/config/HD-Icons"



while :
do
	echo -e "\n传入参数 1，使用镜像地址。例：sh choices.sh 1\n传入参数 2，更新脚本。例：sh choices.sh 2\n"
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
		cd $xdtx_template_dir && echo -e "$hr\n开始下载模板文件\n路径 $xdtx_template_dir/my-${template[$container_num]}.xml\n"&& curl -O "$domain/xushier/my-unraid-docker-templates/main/templates/my-${template[$container_num]}.xml" && sed -i "s/<Icon>.*<\/Icon>/<Icon>${xdtx_icon_dir//\//\\\/}\/${icon[$container_num]}.png<\/Icon>/g" "$xdtx_template_dir/my-${template[$container_num]}.xml" && echo -e "\n模板文件下载完毕。在容器界面点击添加容器，选择该模板即可。$hr"
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
