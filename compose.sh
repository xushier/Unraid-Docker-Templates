#!/bin/bash
declare -A container_edition compose_name
compose_dir="/boot/config/plugins/compose.manager/projects"
raw_domain="https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main"
raw_mirror="https://ghproxy.com/$raw_domain"

if [[ $1 == 1 ]];then domain=$raw_mirror/templates_compose;echo -e "\n使用 Github 镜像加速地址\n";else domain=$raw_domain/templates_compose;fi
if [[ $1 == 2 ]];then curl $raw_mirror/compose.sh > compose.sh;fi

container_edition=(\
[1]="【密码管理器】Vaultwarden_Compose 版" \
)

compose_name=(\
[1]="Bitwarden" \
)

file=("name" "description" "autostart" "docker-compose.yml" "docker-compose.override.yml" ".env")

while :
do
	echo -e "\n传入参数 1，使用镜像地址。例：sh compose.sh 1\n传入参数 2，更新脚本。例：sh compose.sh 2\n"
	for key in $(seq ${#container_edition[@]})
	do
	    echo "$key : ${container_edition[$key]}"
	done
	
	str=$'\n'
	hr="\n--------------------------------------------------------------------------------"
    
	read -p "$str请选择模板序号（1到${#container_edition[@]}，回车直接退出）：" container_num
	if [ $container_num == $str ];then
		echo -e "\n手动退出......"
		break
	fi

	read -p "$str你选择的是：${container_edition[$container_num]}，确定吗?（是输入 y，否输入 n，回车直接退出）" conf
	if [[ $conf == "y" ]] || [[ $conf == "Y" ]];then
        mkdir -p $compose_dir/${compose_name[$container_num]} && cd $compose_dir/${compose_name[$container_num]}
        for f in ${file}
        do
            curl -O "$domain/${compose_name[$container_num]}/$f"
			echo "$domain/${compose_name[$container_num]}/$f"
        done
		echo -e "下载完毕"
		continue
	fi
	if [[ $conf == "n" ]] || [[ $conf == "N" ]];then
		echo -e "\n )~!~( 这都能输错，小迪一脸嫌弃 )~!~(\n"
		continue
	fi
	echo -e "\n手动退出......"
	break
done