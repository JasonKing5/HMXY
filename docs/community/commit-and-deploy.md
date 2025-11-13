---
sidebar_position: 2
draft: true
---

# 提交和部署

图片存储优化及自动部署

## 添加远程推送仓库

额外添加 GitHub 镜像仓库，利用其 actions 做自动部署

```bash
git remote set-url --add --push origin git@gitee.com:mayuanwei/HMXY.git
git remote set-url --add --push origin git@github.com:JasonKing5/HMXY.git
```

## 验证远程推送是否生效

```bash
git remote show origin
```

![验证远程推送是否生效](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/img-1.186c14a8.jpg)

## 提交代码推送到远程

确保推送的代码包含 GitHub 远程

```bash
git push
```

![提交代码推送到远程](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/img-2.b438ae59.jpg)

## 查看部署状态及具体日志

[https://github.com/JasonKing5/HMXY/actions](https://github.com/JasonKing5/HMXY/actions)

![查看部署状态及具体日志](https://hm-1252173264.cos.ap-shanghai.myqcloud.com/docs/img-3.3aa29441.jpg)





