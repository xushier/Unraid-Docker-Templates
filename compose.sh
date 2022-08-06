#!/bin/bash
declare -A container_edition compose_name
compose_dir="/boot/config/plugins/compose.manager/projects"
raw_domain="https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main"
raw_mirror="https://ghproxy.com/$raw_domain"

if [ "$1" = "1" ];then domain=$raw_mirror/templates_compose;echo -e "\n使用 Github 镜像加速地址\n";else domain=$raw_domain/templates_compose;fi
if [ "$1" = "2" ];then curl -#O $raw_mirror/compose.sh > compose.sh;fi

container_edition=(\
[1]="【密码管理器】Vaultwarden_Compose 版" \
)

compose_name=(\
[1]="Bitwarden" \
)

file=("name" "description" "autostart" "docker-compose.yml" "docker-compose.override.yml" ".env")
str=$'\n'
hr="\n------------------------------------------\n"

echo -e "\n开始执行$hr"
echo -e "若下载失败，使用镜像加速地址：sh compose.sh 1\n更新脚本：sh compose.sh 2\n"

while :
do
	if [[ ! -f "/boot/config/plugins/compose.manager.plg" ]] && [[ ! -d "/usr/local/emhttp/plugins/compose.manager" ]];then 
		echo -e "compose.manager 插件未安装！在应用市场搜索 compose 安装即可！\n注意：使用该脚本模板，需要安装 compose.manager 插件，方可使用！\n注意：使用该脚本模板，需要安装 compose.manager 插件，方可使用！\n注意：使用该脚本模板，需要安装 compose.manager 插件，方可使用！" && exit
	else
		echo -e "compose.manager 插件已安装！"
	fi

	echo -e "$hr"
	for key in $(seq ${#container_edition[@]})
	do
	    echo "$key : ${container_edition[$key]}"
	done
	echo -e "$hr"

	read -p "请选择模板序号（1到${#container_edition[@]}，回车直接退出）：" container_num

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

	read -pe "$str你选择的是：\n${container_edition[$container_num]}\n确定吗?（是输入 y，否输入 n，回车直接退出）" conf

	if [[ "$conf" =~ [Yy]+[Ee]?[Ss]? ]];then
		echo -e "$hr"
        mkdir -p $compose_dir/${compose_name[$container_num]} && cd $_
        for f in ${file[@]}
        do
            curl -#O --retry 3 --retry-delay 3 --retry-max-time 15 "$domain/${compose_name[$container_num]}/$f" && echo -e "下载 ${compose_name[$container_num]}--$f 完成"
        done
		echo -e "$hr"
		echo -e "下载完毕，进入 compsoe.manager 插件界面启动即可。"
		echo -e "\n执行结束$hr"
		continue
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