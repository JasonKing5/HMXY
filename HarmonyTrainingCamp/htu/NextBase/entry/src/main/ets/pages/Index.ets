import { router } from '@kit.ArkUI';
import TopTitle from '../view/TopTitle';

@Entry
@Component
struct Index {
  @State title: string = '星河版鸿蒙学习';

  // build函数 构建页面  NEXT版本中默认 相对布局容器。
  build() {
    // 暂时使用线性布局容器 Column
    Column({space:30}){
      TopTitle({title:this.title,isBack:false})

      // 跳转按钮。
      Button('学习ArkUI')
        .onClick(() => {
          router.pushUrl({
            url:  "pages/ArkUI/ArkUIHome"
          })
        })
      Button('学习NetWorkKit')
        .onClick(() => {
          router.pushUrl({
            url:  "pages/NetworkKit/NetWorkKitHome"
          })
        })

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }

}