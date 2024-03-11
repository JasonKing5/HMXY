import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: '鸿蒙学苑',
  tagline: '鸿蒙学苑',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://hm.codefe.cn',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'Joson', // Usually your GitHub org/user name.
  projectName: 'HarmonyOS4.0', // Usually your repo name.

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'zh-CN',
    locales: ['zh-CN', 'en'],
  },

  // scripts: [
  //   {
  //     src: './src/pages/hw_agc.js',
  //     async: true,
  //   },
  // ],

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          // editUrl:
          //   'https://gitee.com/mayuanwei/harmonyOS_bilibili/blob/master/packages/create-docusaurus/templates/shared/',
        },
        blog: {
          showReadingTime: true,
          blogSidebarCount: 'ALL',
          blogSidebarTitle: '全部博客',
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          // editUrl:
          //   'https://gitee.com/mayuanwei/harmonyOS_bilibili/blob/master/packages/create-docusaurus/templates/shared/',
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    // Replace with your project's social card
    image: 'img/docusaurus-social-card.jpg',
    navbar: {
      // title: '鸿蒙学苑',
      logo: {
        alt: '鸿蒙学苑 Logo',
        src: 'img/logotext3.png',
      },
      // title: '鸿蒙学苑',
      // logo: {
      //   alt: '鸿蒙学苑 Logo',
      //   src: 'img/logo.svg',
      // },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'tutorialSidebar',
          position: 'left',
          label: '课程',
        },
        {to: '/blog', label: '博客', position: 'left'},
        // {to: '/showcase', label: '案例', position: 'left'},
        {
          type: 'docSidebar',
          position: 'left',
          sidebarId: 'communitySidebar',
          label: '社区',
        },
        // {to: '/team', label: '团队', position: 'left'},
        {
          type: 'localeDropdown',
          position: 'right',
        },
        {
          href: 'https://gitee.com/mayuanwei/harmonyOS_bilibili',
          label: 'Gitee',
          position: 'right',
        },
        // {
        //   href: '/login',
        //   // label: '登录',
        //   html: '<div id="logInOut">登录<script>const hasToken = localStorage.getItem("hmosxy_token"); const logInOutDom = document.getElementById("logInOut"); logInOutDom.innerHTML = "退出" logInOutDom.addEventListener("click", function() { logOut() console.log("hello"); alert("hello") })</script></div>',
        //   position: 'right',
        // },
      ],
    },
    footer: {
      style: 'dark',
      // links: [
      //   {
      //     title: 'Docs',
      //     items: [
      //       {
      //         label: '课程',
      //         to: '/docs/intro',
      //       },
      //     ],
      //   },
      //   {
      //     title: 'Community',
      //     items: [
      //       {
      //         label: 'Stack Overflow',
      //         href: 'https://stackoverflow.com/questions/tagged/docusaurus',
      //       },
      //       {
      //         label: 'Discord',
      //         href: 'https://discordapp.com/invite/docusaurus',
      //       },
      //       {
      //         label: 'Twitter',
      //         href: 'https://twitter.com/docusaurus',
      //       },
      //     ],
      //   },
      //   {
      //     title: 'More',
      //     items: [
      //       {
      //         label: '博客',
      //         to: '/blog',
      //       },
      //       {
      //         label: 'Gitee',
      //         href: 'https://gitee.com/mayuanwei/harmonyOS_bilibili',
      //       },
      //     ],
      //   },
      // ],
      // 湘ICP备2023009620号-2
      copyright: `ICP备案<a href=" https://beian.miit.gov.cn/" target="_blank" style="margin-left: 5px; margin-right: 20px; color: #b5b5b5">豫ICP备2022004823号-1</a> Copyright © ${new Date().getFullYear()} 鸿蒙学苑`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
