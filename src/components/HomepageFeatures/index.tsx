import React from 'react';
import styles from './styles.module.css';

interface FeatureItem {
  title: string;
  img: string;
  description: string;
  url: string;
  type?: string;
}

const FeatureList: FeatureItem[] = [
  {
    title: "华为开发者联盟HDE",
    img: "/img/home_image1.png",
    description: "全球开发者专家、HarmonyOS学习资源创作达人、深圳市讯方技术股份有限公司老师",
    url: "https://developer.huawei.com/consumer/cn/programs/hde",
    type: "user"
  },
  {
    title: "HarmonyOS开发者社区唯一收藏",
    img: "/img/home_image2.png",
    description: "全网首发HarmonyOS4.0教程，开发者社区赠予野生鸿蒙侠称号",
    url: "https://space.bilibili.com/1465232701/favlist",
  },
  {
    title: "开源鸿蒙gitee仓库教程指南",
    img: "/img/home_image3.png",
    description: "个人仓库被收录为OpenHarmony官方教程指南",
    url: "https://gitee.com/mayuanwei/harmonyOS_bilibili"
  },
];

function Feature({ title, img, description, url, type }: FeatureItem) {
  return (
    <a 
      href={url} 
      target="_blank" 
      rel="noopener noreferrer" 
      className={styles.featureItem}
    >
      <img 
        src={img} 
        alt={title} 
        className={type === 'user' ? styles.featureImage1 : styles.featureImage} 
        loading="lazy"
      />
      <h3 className={styles.featureTitle}>{title}</h3>
      <p className={styles.featureDesc}>{description}</p>
      {/* <span className={styles.featureLink}>查看详情</span> */}
    </a>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      {FeatureList.map((props, idx) => (
        <Feature key={idx} {...props} />
      ))}
    </section>
  );
}
