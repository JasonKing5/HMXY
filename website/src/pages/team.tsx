import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import useBaseUrl, {useBaseUrlUtils} from '@docusaurus/useBaseUrl';
import Heading from '@theme/Heading';
import Tweet from '@site/src/components/Tweet';
import React, { useState } from 'react'
import {
  ActiveTeamRow,
  HonoraryAlumniTeamRow,
  StudentFellowsTeamRow,
} from '@site/src/components/TeamProfileCards';

import styles from './team.module.css';

export default function Home(): JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={'团队'}
      description="课程团队介绍">
      <main>
        <div className={styles.teamContainer}>
          <h1>核心成员</h1>
          <p>核心成员致力于系列教程的设计、备课、录制视频等核心任务。</p>
          <p>现有核心成员按字母顺序列出如下。</p>
          <ActiveTeamRow />
        </div>
        {/* <div className='container' style={{padding: '0 120px', marginTop: '40px'}}>
          <h1>合作者</h1>
          <HonoraryAlumniTeamRow />
        </div> */}
        <div className={styles.teamContainer}>
          <h1>特别鸣谢</h1>
          <p>本鸿蒙 HarmonyOS4.0 教程最初由 帝心&庄生 打造。 时至今日，已经有数十位贡献者自愿主动参与。 我们希望对过去向本鸿蒙教程各个环节做出贡献的众人表示感谢：</p>
          <ul>
            <li><Link to={""}></Link></li>
            <li><Link to={""}></Link></li>
          </ul>
        </div>
        <div className={styles.teamContainer}>
          <h1>感谢支持</h1>
          <h3>为众人抱薪者不可使其冻毙于风雪</h3>
          <h4>课程全部免费，大家也完全可以拿去传播。但如果能因此获利，我将备受鼓舞。</h4>
          <h4>注：量力而行！！！心意即可！！！</h4>
          <div style={{display: 'flex', justifyContent: 'space-evenly', marginBottom: '20px'}}>
            <img
              alt={'Docusaurus with Keytar'}
              className={styles.heroLog}
              src={useBaseUrl('/img/team_money_wechat.jpg')}
              width="200"
              height="200"
            />
            <img
              alt={'Docusaurus with Keytar'}
              className={styles.heroLog}
              src={useBaseUrl('/img/team_money_alipay.jpg')}
              width="200"
              height="200"
            />
          </div>
        </div>
      </main>
    </Layout>
  );
}