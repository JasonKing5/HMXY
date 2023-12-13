import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import HomepageFeatures from '@site/src/components/HomepageFeatures';
import useBaseUrl, {useBaseUrlUtils} from '@docusaurus/useBaseUrl';
import Heading from '@theme/Heading';
import Tweet from '@site/src/components/Tweet';
import React, { useState } from 'react'

import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className="hero__title">
          <img
            alt={'Docusaurus with Keytar'}
            className={styles.heroLogo}
            src={useBaseUrl('/img/index_title.png')}
            width="200"
            height="200"
          />
          <span className={styles.heroTitleTextHtml} >新版本鸿蒙 HarmonyOS4.0 教程</span>
          <br />
        </Heading>
        {/* <p className="hero__subtitle">帝心 & 庄生</p> */}
        {/* <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to="/docs/intro">
            Docusaurus 课程 - 5min ⏱️
          </Link>
        </div> */}
      </div>
    </header>
  );
}

function imageContent({src, alt = '', width = '200', height = '200'}) {
  const [imageActive, setImageActive] = useState(false)
  return (
    <div 
      // onClick={() => {
      //   setImageActive(!imageActive)
      // }}
      className={imageActive ? 'image-content-active' : 'image-content'}
      style={{position: 'relative'}}
    >
      <img
        alt={alt}
        className={styles.imageContentImg}
        style={{position: imageActive ? 'absolute' : 'relative', }}
        src={useBaseUrl(src)}
        width={imageActive ? '500' : width}
        height={imageActive ? '500' : height}
      />
    </div>
  )
}

function Resources() {
  const [activeQQTab, setActiveQQTab] = useState(0);

  const changeQQTab = (index) => {
    setActiveQQTab(index);
  };
  const [activeWechatTab, setActiveWechatTab] = useState(0);

  const changeWechatTab = (index) => {
    setActiveWechatTab(index);
  };


  const buttonStyle = {
    height: "30px",
    padding: "0 10px",
    border: "1px solid #e5e5e5",
    borderRadius: "4px",
    fontSize: "16px",
    backgroundColor: "#dfdfdf",
    cursor: 'pointer',
  }
  const buttonSelectedStyle = {
    backgroundColor: '#2c78e5',
    color: "white",
  }
  const buttonStl = (type, index) => {
    if (type === 'qq') {
      return activeQQTab == index ? {...buttonStyle, ...buttonSelectedStyle} : buttonStyle
    } else {
      return activeWechatTab == index ? {...buttonStyle, ...buttonSelectedStyle} : buttonStyle
    }
  }
  const labelStyle = {
    backgroundColor: '#94e3ff',
    padding: '0 5px',
    display: 'inline-block',
  }
  return (
    <div style={{}}>
      <div>文档资料：<Link to={'https://mayw-teaching.feishu.cn/drive/folder/Qm0LfbzjIlBwE8duFZ1cKEKinUd'}>访问飞书资料库</Link></div>
      <div>代码地址：<Link to={'https://gitee.com//mayuanwei/harmonyOS_bilibili'}>访问 Gitee 代码库</Link></div>

      <div style={{display: 'flex', justifyContent: 'space-around', marginTop: '10px'}}>
        <div className='we-chat-tabs'>
          <div className="tab-header">
            <span style={labelStyle}>微信群助手</span>
            <button style={buttonStl('wechat', 0)} onClick={() => changeWechatTab(0)}>英雄哥</button>
            <button style={buttonStl('wechat', 1)} onClick={() => changeWechatTab(1)}>7大哥</button>
            <button style={buttonStl('wechat', 2)} onClick={() => changeWechatTab(2)}>小孙同学</button>
            <button style={buttonStl('wechat', 3)} onClick={() => changeWechatTab(3)}>荒天帝</button>
          </div>
          <div className="tab-content">
            {activeWechatTab === 0 && <div>{imageContent({src: '/img/index_chat_1.jpg', })}</div>}
            {activeWechatTab === 1 && <div>{imageContent({src: '/img/index_chat_2.jpg', })}</div>}
            {activeWechatTab === 2 && <div>{imageContent({src: '/img/index_chat_3.jpg', })}</div>}
            {activeWechatTab === 3 && <div>{imageContent({src: '/img/index_chat_4.jpg', })}</div>}
          </div>
        </div>

        <div className='qq-chat-tabs'>
          <div className="tab-header">
            <span style={labelStyle}>QQ群</span>
            <button style={buttonStl('qq', 0)} onClick={() => changeQQTab(0)}>1 群</button>
            <button style={buttonStl('qq', 1)} onClick={() => changeQQTab(1)}>2 群</button>
            <button style={buttonStl('qq', 2)} onClick={() => changeQQTab(2)}>3 群</button>
          </div>
          <div className="tab-content">
            {activeQQTab === 0 && <div>{imageContent({src: '/img/index_qq_1.jpg', })}</div>}
            {activeQQTab === 1 && <div>{imageContent({src: '/img/index_qq_2.jpg', })}</div>}
            {activeQQTab === 2 && <div>{imageContent({src: '/img/index_qq_3.jpg', })}</div>}
          </div>
        </div>
      </div>
    </div>
  )
}

function VideoContainer() {
  const [qqIndex, setQQIndex] = React.useState(0)
  return (
    <div className="container text--center margin-top--xl">
      <div className="row">
        <div className="col">
          <Heading as="h2">
            免费在线观看全部教学视频
          </Heading>
          <div className="video-container" style={{
                marginTop: '55px',
                marginBottom: '20px',
          }}>
            <iframe src="//player.bilibili.com/player.html?aid=620886009&bvid=BV1pb4y1g75m&cid=1332523295&p=1" scrolling="no" className={styles.videoIframe}> </iframe>
          </div>
        </div>
        <div className="col">
          <Heading as="h2">
            配套资料及学习交流群
          </Heading>
          <Resources />
        </div>
      </div>
    </div>
  );
}

function TweetsSection() {
  const tweetColumns = [
    [
      {
        avatar: '/img/index_fans_1.png', 
        name: '黑马pink讲前端', 
        content: '不错不错，更新很快哈~加油~。看你视频，感觉咱俩风格很像哈，但是你声音更好听，而且很有诗意~~ 真的不错，加油加油~~有点意思哈~~。一起加油哈😊', 
        date: '2023-11-23 16:06', 
      },
      
      {
        avatar: '/img/index_fans_3.png', 
        name: '真实z', 
        content: '鸿蒙真的慢慢推向主流了阿，我软件专业以往移动应用开发交的都是安卓，就我这一届开始教鸿蒙了，现在学的就是鸿蒙4.0', 
        date: '2023-11-28 11:05', 
      },
    ],
    [
      {
        avatar: '/img/index_fans_2.png', 
        name: '鸿蒙钊哥', 
        content: '据说这个很受小白欢迎', 
        date: '2023-11-23 23:33', 
      },
      {
        avatar: '/img/index_fans_4.png', 
        name: '天000明', 
        content: '讲的很细，虽然自己已经官网学过一遍了，但看UP主的视频总是能给我查缺补漏的感觉，赞！话说第二季什么时候更新，哈哈', 
        date: '2023-11-25 10:06', 
      },
    ],
    [
      {
        avatar: '/img/index_fans_5.png', 
        name: 'zachariahkk', 
        content: '讲的挺细，不错。看了俩月鸿蒙了，之前做iOS，现在在西安找鸿蒙的岗位，几乎都只要前端和安卓的[笑哭]', 
        date: '2023-11-23 23:33', 
      },
      {
        avatar: '/img/index_fans_6.png', 
        name: 'sun2night', 
        content: 'B站学过这么多视频，这个视频是最通俗易懂的。UP主，坚持下去，你讲的是真的非常好。我年过40的人，居然都几乎不用看第二次就学会了。这教学水平真的一流啊。我的理解是，UP主对于自己所教学的东西理解很透彻，所以才能教得行云流水！感谢！', 
        date: '2023-11-16 23:25', 
      },
    ]
  ];

  return (
    <div className={clsx(styles.section, styles.sectionAlt)}>
      <div className="container">
        <Heading as="h2" className={clsx('margin-bottom--lg', 'text--center')}>
          广大网友的暖心好评
        </Heading>
        <div className={clsx('row', styles.tweetsSection)}>
          {tweetColumns.map((tweetItems, i) => (
            <div className="col col--4" key={i}>
              {tweetItems.map((tweet) => (
                <Tweet {...tweet} key={tweet.name} />
              ))}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default function Home(): JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`Hello from ${siteConfig.title}`}
      description="Description will go into a meta tag in <head />">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
        <VideoContainer />
        <TweetsSection />
      </main>
    </Layout>
  );
}
