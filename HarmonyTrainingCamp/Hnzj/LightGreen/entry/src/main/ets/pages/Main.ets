import BaiPoem from '../view/BaiPoem'
import Title from '../view/Title'

@Entry
@Component
struct Main {
  // 自定义build函数组件
  @Builder
  myTab(imgSrc: Resource, tabBarName: string) {
    Column({ space: 10 }) {
      Image(imgSrc)
        .width(30)
        .fillColor('#ff0e7cea')
      Text(tabBarName)
    }
  }

  build() {
    Column({ space: 20 }) {
      Title()
      Divider()
      Tabs({ barPosition: BarPosition.Start }) {
        //获取诗句
        TabContent() {
          BaiPoem()
        }
        .tabBar(this.myTab($r('app.media.logo'), '百诗斩'))

        // ***
        TabContent() {

        }
        .tabBar(this.myTab($r('app.media.di'), '帝心推荐'))
      }
      .vertical(false)
      .layoutWeight(1)
      .margin({
        bottom: 30
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Start)
  }
}