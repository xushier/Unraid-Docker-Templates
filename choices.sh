#!/bin/bash

declare -A container template
xdtx_template_dir="/boot/config/plugins/dockerMan/templates-user"
raw_domain="https://raw.githubusercontent.com/xushier/Unraid-Docker-Templates/main"
raw_mirror="https://ghproxy.com/$raw_domain"

container=(\
[1]="【PT 下载器 QB】【荒野无灯版】" \
[2]="【PT 下载器 QB】【LS 版】" \
[3]="【PT 下载器 QB】【多功能版】" \
[4]="【PT 下载器 QB】【快检版】" \
[5]="【BT 下载器 QB】【BT 增强版】" \
[6]="【PT 下载器 TR】【LS 版】" \
[7]="【PT 下载器 TR】【快检版】" \
[8]="【BT 下载器 Aria2NG】【Oldiy 版】" \
[9]="【密码管理器 Vaultwarden】【SQLite 版】" \
[10]="【文件管理器 Filebrowser】【荒野无灯版】" \
[11]="【文件管理器 Filebrowser】【官方版】" \
[12]="【青龙面板】【官方版】" \
[13]="【容器指令转换 Composerize】【官方版】" \
[14]="【流程图绘制 Draw.io】【官方版】" \
[15]="【电子书阅读器 KoodoReader】【xushier 版】" \
[16]="【目录及文件结构信息记录 Snap2Html】【321661 版】" \
[17]="【网盘挂载文件管理器 Alist】【官方版】" \
[18]="【阿里云 WEBDAV】【messense 版】" \
[19]="【百度网盘】【johngong 版】" \
[20]="【小猫咪魔法代理 Clash】【dreamacro 版】" \
[21]="【代码服务器 CodeServer】【官方版】" \
[22]="【辅种神器 IYUU-Plus】【官方版】" \
[23]="【容器管理器 Portainer】【官方版】" \
[24]="【网易云灰色歌曲解锁 UnblockMusic】 版" \
[25]="【加密音乐格式转换 UnlockMusic】 版" \
[26]="【影音服务 Emby】【LS 版】" \
[27]="【影音服务 Jellyfin】【LS 版】" \
[28]="【影音服务 Dim】【官方版】" \
[29]="【协作白板 WhiteBophir】【官方版】" \
[30]="【谷歌浏览器 Chrome】【官方版】" \
[31]="【数据库 MariaDB】【LS 版】" \
[32]="【缓存数据库 Redis】【LS 版】" \
[33]="【缓存数据库 Memcached】【LS 版】" \
[34]="【可道云 Kodbox】【Sqlite 版】" \
[35]="【网易云音乐 YesplayMusic】【官方版】" \
[36]="【图床 Lskypro】【版】" \
[37]="【网页服务器 Nginx】【LS 版】" \
[38]="【远程文件服务 WEBDAV】【版】" \
[39]="【对象存储服务 Minio】【官方版】" \
[40]="【Jellyfin 前端界面 Jellyfin-Vue】【官方版】" \
[41]="【电驴下载器 Amule】【版】" \
[42]="【远程控制服务 RustDesk】【官方版】" \
[43]="【迅雷远程下载 Xunlei】【cnk3x 版】" \
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
[12]="Qinglong" \
[13]="Composerize" \
[14]="Draw.io_OF" \
[15]="KoodoReader_Xushier" \
[16]="Snap2Html_321661" \
[17]="Alist_OF" \
[18]="AliyunWebdav_Messense" \
[19]="BaiduNetdisk_Johngong" \
[20]="Clash_Dreamacro" \
[21]="CodeServer_OF" \
[22]="IYUU-Plus_OF" \
[23]="Portainer_OF" \
[24]="UnblockMusic" \
[25]="UnlockMusic" \
[26]="Emby_LS" \
[27]="Jellyfin_LS" \
[28]="Dim_OF" \
[29]="Wbo" \
[30]="Chrome" \
[31]="MariaDB_LS" \
[32]="Redis" \
[33]="Memcached" \
[34]="Kodbox" \
[35]="YesplayMusic" \
[36]="Lskypro" \
[37]="Nginx" \
[38]="WEBDAV" \
[39]="Minio" \
[40]="Jellyfin-Vue" \
[41]="Amule" \
[42]="RustDesk" \
[43]="Xunlei" \
)

str=$'\n'
hr="\n------------------------------------------\n"

echo -e "\n若下载失败，使用镜像加速地址：sh compose.sh 1\n更新脚本：sh compose.sh 2\n"
echo -e "开始执行$hr"

if [[ $1 == 1 ]];then domain=$raw_mirror;echo -e "使用 Github 镜像加速地址\n";else domain=$raw_domain;fi
if [[ $1 == 2 ]];then curl -#O $raw_mirror/choices.sh > choices.sh;fi

while :
do
	echo -e "$hr"
	for key in $(seq ${#container[@]})
	do
	    echo "$key : ${container[$key]}"
	done
	echo -e "$hr"
    
	read -p "请选择模板序号（ 1 到 ${#container[@]}，回车直接退出）：" container_num

	if test x$container_num = x$str;then
		echo -e "\n手动退出......"
		break
	fi

	if [[ "$container_num" =~ [0-9]+ ]];then
		if [ $container_num -gt ${#container[@]} ] > /dev/null 2>&1;then
			echo -e "\n请输入正确的模板序号！"
			continue
		fi
	else
		echo -e "\n输入错误，请重新选择！"
		continue
	fi

	read -p "$str你选择的是：${container[$container_num]}，确定吗?（是输入 y，否输入 n，回车直接退出）" conf

	if [[ "$conf" =~ [Yy]+[Ee]?[Ss]? ]];then
		cd $xdtx_template_dir && \
		echo -e "$hr开始下载模板文件\n路径 $xdtx_template_dir/my-${template[$container_num]}.xml\n"
		curl -s --head "$domain/templates/my-${template[$container_num]}.xml" | head -n 1 | egrep -o "404"
		if test $? = 0;then
			echo -e "远端模板文件不存在！请等待更新或联系小迪更新。QQ群：647605169"
			continue
		else
			curl -#O --retry 3 --retry-delay 3 --retry-max-time 15 "$domain/templates/my-${template[$container_num]}.xml" && echo -e "\n模板文件下载完毕。在容器界面点击添加容器，选择该模板即可。$hr"
		fi

		if [[ $container_num -eq 1 ]];then
			mkdir -p /mnt/user/appdata/Qbittorrent_80x86/config && cd $_
			echo -e "开始下载配置文件"
			curl -#o qBittorrent.conf --retry 3 --retry-delay 3 --retry-max-time 15 "$domain/templates/my-${template[$container_num]}.conf"
		fi
		if [[ $container_num -eq 7 ]];then
			mkdir -p /mnt/user/appdata/Transmission_CB/transmission-web-control && cd $_
			echo -e "开始下载主题包"
			curl -#o web_control.zip --retry 3 --retry-delay 3 --retry-max-time 15 https://ghproxy.com/https://github.com/ronggang/transmission-web-control/archive/refs/tags/v1.6.1-update1.zip
			unzip -q web_control.zip && cp -r transmission-web-control-1.6.1-update1/src/* ./ && rm -rf transmission-web-control-1.6.1-update1
			mkdir -p /mnt/user/appdata/Transmission_CB/config && cd $_
			echo -e "开始下载配置文件"
			curl -#o settings.json --retry 3 --retry-delay 3 --retry-max-time 15 "$domain/templates/my-${template[$container_num]}.json"
		fi

		echo -e "$hr图标库地址：https://github.com/xushier/HD-Icons\n公众号：小迪同学\n B 站：煦诗儿$hr"
		break
	fi

	if [[ "$conf" =~ [Nn]+[Oo]? ]];then
		echo -e "\n )~!~( 这都能输错，小迪一脸嫌弃 )~!~("
		continue
	fi

	if test x$conf = x$str;then
		echo -e "\n手动退出......"
		break
	fi

	echo -e "\n瞪大眼睛瞅瞅👀你输的是个啥！"
	continue
done
