import RouterCfg from '../common/routerConfig';
import NavigationList from '../view/NavigationList';
import TopTitle from '../view/TopTitle';

@Entry
@Component
struct Index {
  @State title: string = '星河版鸿蒙学习';

  // build函数 构建页面  NEXT版本中默认 相对布局容器。
  build() {
    // 暂时使用线性布局容器 Column
    Column({ space: 30 }) {
      TopTitle({ title: this.title, isBack: false })
      // 导航列表
      NavigationList({homeArr:RouterCfg.homeArr})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}