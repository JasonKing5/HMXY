/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

/* eslint-disable global-require */

import {sortBy} from '@site/src/utils/jsUtils';

/*
 * ADD YOUR SITE TO THE DOCUSAURUS SHOWCASE
 *
 * Please don't submit a PR yourself: use the Github Discussion instead:
 * https://github.com/facebook/docusaurus/discussions/7826
 *
 * Instructions for maintainers:
 * - Add the site in the json array below
 * - `title` is the project's name (no need for the "Docs" suffix)
 * - A short (≤120 characters) description of the project
 * - Use relevant tags to categorize the site (read the tag descriptions on the
 *   https://docusaurus.io/showcase page and some further clarifications below)
 * - Add a local image preview (decent screenshot of the Docusaurus site)
 * - The image MUST be added to the GitHub repository, and use `require("img")`
 * - The image has to have minimum width 640 and an aspect of no wider than 2:1
 * - If a website is open-source, add a source link. The link should open
 *   to a directory containing the `docusaurus.config.js` file
 * - Resize images: node admin/scripts/resizeImage.js
 * - Run optimizt manually (see resize image script comment)
 * - Open a PR and check for reported CI errors
 *
 * Example PR: https://github.com/facebook/docusaurus/pull/7620
 */

// LIST OF AVAILABLE TAGS
// Available tags to assign to a showcase site
// Please choose all tags that you think might apply.
// We'll remove inappropriate tags, but it's less likely that we add tags.
export type TagType =
  | '官方'
  | '个人'
  | '产品'
  | '界面'
  | '开源'

// Add sites to this list
// prettier-ignore
const Users: User[] = [
  {
    title: '按钮组件',
    description: '基础组件之按钮组件',
    preview: '/img/showcase/button.png',
    website: '#',
    source: 'https://gitee.com/mayuanwei/harmonyOS_bilibili/blob/master/Components/entry/src/main/ets/pages/basic/Button.ets',
    tags: ['官方', '开源'],
    like: ['2']
  },
  {
    title: '复选框组件',
    description: '基础组件之复选框组件',
    preview: '/img/showcase/checkbox.png',
    website: '#',
    source: 'https://gitee.com/mayuanwei/harmonyOS_bilibili/blob/master/Components/entry/src/main/ets/pages/basic/Checkbox.ets',
    tags: ['官方', '开源'],
    like: ['1', '2']
  },

  /*
  Pro Tip: add your site in alphabetical order.
  Appending your site here (at the end) is more likely to produce Git conflicts.
   */
];

export type User = {
  title: string;
  description: string;
  preview: string | null; // null = use our serverless screenshot service
  website: string;
  source: string | null;
  tags: TagType[];
  like: string[];
};

export type Tag = {
  label: string;
  description: string;
  color: string;
};

export const Tags: {[type in TagType]: Tag} = {
  官方: {
    label: '官方',
    description: '视频教程配套案例。',
    color: '#e9669e',
  },
  个人: {
    label: '个人',
    description: '学员个人练习案例。',
    color: '#14cfc3',
  },
  开源: {
    label: '开源',
    description: '案例源代码开源。',
    color: '#39ca30',
  },
  界面: {
    label: '界面',
    description: '纯界面案例，重点展示UI布局。',
    color: '#a44fb7',
  },
  产品: {
    label: '产品',
    description: '完整的项目案例。',
    color: '#dfd545',
  },
};

export const TagList = Object.keys(Tags) as TagType[];
function sortUsers() {
  let result = Users;
  // Sort by site name
  result = sortBy(result, (user) => user.title.toLowerCase());
  // Sort by favorite tag, favorites first
  // result = sortBy(result, (user) => !user.tags.includes('官方'));
  return result;
}

export const sortedUsers = sortUsers();
