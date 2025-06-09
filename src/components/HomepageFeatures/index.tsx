import clsx from "clsx";
import Heading from "@theme/Heading";
import styles from "./styles.module.css";
import useBaseUrl, { useBaseUrlUtils } from "@docusaurus/useBaseUrl";

type FeatureItem = {
  title: string;
  img: any;
  description: JSX.Element;
  url: string;
};

const FeatureList: FeatureItem[] = [
  {
    title: "华为开发者联盟HDE",
    img: "/img/home_image1.png",
    description: <>全球开发者专家、HarmonyOS学习资源创作达人</>,
    url:"https://developer.huawei.com/consumer/cn/programs/hde"
  },
  {
    title: "HarmonyOS开发者社区唯一收藏",
    img: "/img/home_image2.png",
    description: <>全网首发HarmonyOS4.0教程，开发者社区赠予野生鸿蒙侠称号</>,
    url:"https://space.bilibili.com/1465232701/favlist"
  },
  {
    title: "开源鸿蒙gitee仓库教程指南",
    img: "/img/home_image3.png",
    description: <>个人仓库被收录为OpenHarmony官方教程指南</>,
    url:"https://gitee.com/mayuanwei/harmonyOS_bilibili"
  },
];

function Feature({ title, img, description, url }: FeatureItem) {
  return (
    <div className={clsx("col col--4", styles.featureItem)} onClick={() => window.open(url)}>
      <div className="text--center">
        <img className={styles.featureSvg} role="img" src={useBaseUrl(img)} />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
