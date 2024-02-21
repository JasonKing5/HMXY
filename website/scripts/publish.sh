#!/bin/bash

# 拉取指定git仓库的代码
# git clone https://gitee.com/mayuanwei/harmonyOS_bilibili.git /tmp/website

# 进入代码目录
echo "cd /var/repo/harmonyOS_bilibili"
cd /var/repo/harmonyOS_bilibili
pwd

# 更新代码
echo "sudo git pull"
sudo git pull

# 进入网站代码根目录
echo "cd ./website"
cd ./website
pwd

# 执行 npm install 并等待完成，然后执行 npm run build
sudo npm install && npm run build

# 复制构建后的文件到目标目录并强制替换覆盖
sudo rsync -av --delete /var/repo/harmonyOS_bilibili/website/build/ /var/www/hm.codefe.cn/

echo "[SUCCESS] deploy"

