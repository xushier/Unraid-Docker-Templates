# 换源
# vi /etc/apt/sources.list
sed -i "s@http://deb.debian.org@https://mirrors.163.com@g" /etc/apt/sources.list

# 系统代理
export http_proxy="http://12.12.12.222:7890"
export https_proxy="http://12.12.12.222:7890"
source /etc/profile

# 更新
apt update
apt upgrade

# 安装Wget和Git
apt install -y wget
apt install -y git

# 安装NodeJS并全局链接
cd /home
wget https://nodejs.org/dist/latest-v19.x/node-v19.7.0-linux-x64.tar.gz
tar -xvf node-v19.7.0-linux-x64.tar.gz
ln -s /home/node-v19.7.0-linux-x64/bin/npm /usr/local/bin
ln -s /home/node-v19.7.0-linux-x64/bin/node /usr/local/bin

# 安装Hexo并全局链接
npm install -g hexo-cli
npm install -g npm@9.5.1
ln -s /home/node-v19.7.0-linux-x64/bin/hexo /usr/local/bin

# 安装pm2和pnpm并链接。pm2是nodejs的前端持续运行管理工具；pnpm后面安装Hexon需要用到。
npm install -g pm2
npm install -g pnpm
ln -s /home/node-v19.7.0-linux-x64/bin/pm2 /usr/local/bin
ln -s /home/node-v19.7.0-linux-x64/bin/pnpm /usr/local/bin

# 初始化Hexo并安装运行
hexo init blog
cd blog
npm install

# 安装Hexo-Admin
npm install --save hexo-admin

# 安装主题Next
git clone https://github.com/next-theme/hexo-theme-next themes/next

# 安装Hexon编辑器并在后台持续运行
git clone https://github.com/gethexon/hexon
cd hexon
pnpm install
# pnpm run setup
# pnpm prd


# 后台持续运行Hexo
# cd <dir>
# touch hexo_run.js
# vi hexo_run.js
# # 内容
# # //run
# # const { exec } = require('child_process')
# # exec('hexo server',(error, stdout, stderr) => {
# #         if(error){
# #                 console.log('exec error: ${error}')
# #                 return
# #         }
# #         console.log('stdout: ${stdout}');
# #         console.log('stderr: ${stderr}');
# # })
# pm2 start hexo_run.js




# 安装NFS共享
apt install nfs-kernel-server -y
echo "/blog 12.12.12.0/24(rw,sync,root_squash,no_subtree_check)" | tee -a /etc/exports
# vi /etc/exports
# 内容
# /blog 12.12.12.0/24(rw,sync,root_squash,no_subtree_check)
exportfs -rv
