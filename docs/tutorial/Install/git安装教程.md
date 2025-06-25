---
sidebar_position: 100
---
:::tip
    协同开发必会技能
:::


## git安装与基本使用

### 1. [git下载国内镜像地址](https://registry.npmmirror.com/binary.html?path=git-for-windows/)

### 2. 拉到底部找到最新版本
> 编写本文档时刻，最新版本为2.50。您看到时，或许会有更新版本。选择最新即可。

![alt text](screenshots/git安装教程/git安装教程/image.png)

### 3.选择对应版本安装包下载
> 如果你是windows电脑，选择64-bit.exe下载。

![alt text](screenshots/git安装教程/image-1.png)

### 4.双击安装包进行安装
> 无脑下一步，一路next！直到结束。安装路径可以默认C盘也可以修改其他位置，但是要求不能有中文以及花里胡哨的路径。

![alt text](screenshots/git安装教程/image-2.png)

![alt text](screenshots/git安装教程/image-3.png)

### 测试是否安装成功
> `win+r`输入`cmd`进入终端黑窗口，输入命令：`git -v`。查看版本号。
> 
> 如果正确显示版本号，说明安装成功。如果提示：`不是内部或外部命令。说明安装失败。`

![启动终端](screenshots/git安装教程/image-4.png)

![查看版本号](screenshots/git安装教程/image-5.png)

### 5. gitee注册登录+创建仓库

#### [1. gitee平台完成注册登录](https://gitee.com/)
> 注册gitee账号时候，手机号和密码无比记清楚。后续会使用。

#### 2. 创建临时仓库
![创建仓库](screenshots/git安装教程/image-6.png)

#### 3. git全局设置

![全局设置用户信息](screenshots/git安装教程/image-7.png)
> `win+r`输入`cmd`进入终端黑窗口，粘贴上图命令，`回车`执行。

### git代码同步基本命令
> 本地仓库变化后同步云端。
>
>第一次推送到云端会弹出提示框，需要输入注册gitee网站时的手机号和密码。
```
git add .

git commit -m '备注提交信息'

git push
```
> 云端仓库变化后拉取到本地同步更新
```
git pull
```
---


>[禹神git快速入门视频教程](https://pan.baidu.com/s/1cPbaR8l7vKpny0g5WOt1UA?pwd=dxin)
