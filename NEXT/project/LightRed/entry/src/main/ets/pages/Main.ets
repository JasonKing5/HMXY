import BaiPoem from '../view/BaiPoem'
import Recomment from '../view/Recomment'
import Title from '../view/Title'

@Entry
@Component
struct Main {
  @State currentIndex: number = 0

  // 自定义build函数组件
  @Builder
  myTab(imgSrc: Resource, tabBarName: string, index: number) {
    Column({ space: 10 }) {
      Image(imgSrc)
        .width(30)
        .fillColor(this.currentIndex === index ? '#ffde1bb0' : '#ff0e7cea')
      Text(tabBarName)
        .fontColor(this.currentIndex === index ? '#ffde1bb0' : '#ff0e7cea')
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
        .tabBar(this.myTab($r('app.media.logo'), '何浅红', 0))

        // 帝心推荐
        TabContent() {
          Recomment()
        }
        .tabBar(this.myTab($r('app.media.di'), '帝心推荐', 1))
      }
      .vertical(false)
      .layoutWeight(1)
      .margin({
        bottom: 30
      })
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Start)
  }
}