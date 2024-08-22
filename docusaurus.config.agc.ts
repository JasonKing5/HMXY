import type {Config} from '@docusaurus/types';
import commonConfig from './docusaurus.config.common'
import agcConfig from './config/config.agc';

/** @type {import('@docusaurus/types').Config} */
const config: Config = {
  ...commonConfig,
  url: agcConfig.url,
  trailingSlash: agcConfig.trailingSlash,
  organizationName: agcConfig.organizationName,
  themeConfig: {
    ...commonConfig.themeConfig,
    footer: {
      copyright: `ICP备案<a href=" https://beian.miit.gov.cn/" target="_blank" style="margin-left: 5px; margin-right: 20px; color: #b5b5b5">${agcConfig.icp}</a> Copyright © ${new Date().getFullYear()} 鸿蒙学苑`,
    },
  },
};

export default config;
