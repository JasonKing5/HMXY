---
sidebar_position: 1
id: dev
sidebar_label: 网站介绍
slug: /community/dev
---

# 网站介绍

## 功能模块

- [网站首页](https://hm.codefe.cn/)
- [课程](https://hm.codefe.cn/docs/intro/)
- [博客](https://hm.codefe.cn/blog)
- [社区-团队](https://hm.codefe.cn/team)

## 技术栈

- [React.js](https://react.dev/) 用于构建 web 用户界面的前端开发框架
- [Docusaurus](https://docusaurus.io/) 快速构建以内容为核心的最佳网站
- MarkDown 编写静态文档页面

## 本地运行

### Installation

```bash
$ yarn
```

### Local Development

```bash
$ yarn start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

### Build

```bash
$ yarn build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

## 开发指南

| 目录文件             | 作用                 |
| -------------------- | -------------------- |
| docs                 | 课程文档             |
| src/components       | React 组件代码       |
| src/pages            | React 页面代码       |
| static               | React 页面图片等资源 |
| docusaurus.config.ts | 项目配置文件         |
| sidebars.ts          | 路由配置文件         |

### 添加课程笔记文档

比如第二季添加第一节课程

1. `docs/session2` 文件夹下创建 `session-2-01.md`
2. `sidebars.ts` 文件中 `tutorialSidebar` 内找到 `label: '第二季：实战开发'` 对应的 `items` 中添加 `'session2/session-2-01',`
3. 课程页面 `第二季：实战开发` 目录下即可看到 `session-2-01.md` 文件对应的文档页面

### 添加 React 页面

比如在顶部导航栏最后加一个 `论坛` 页面

1. `src/pages/` 文件夹下创建 `forum.tsx` ,并编写论坛页面内容
2. `docusaurus.config.ts` 文件中 `navbar` 内找到对应的 `items` 中添加 `{to: '/blog', label: '博客', position: 'left'},`
3. 即可在顶部导航栏看到论坛导航按钮

## 未来规划

- [ ] [案例展示](#)
- [ ] [论坛](#)
- [ ] [xxx](#)

欢迎大家提出宝贵建议

:::tip

由于团队需要专注录制视频教程，网站开发方面精力有限。真诚地邀请有志之士加入我们的团队，共同推动网站的开发。

欢迎有兴趣的朋友联系我们。

:::
