// 按钮样式
import router from '@ohos.router'

@Entry
@Component
struct ButtonDemo {
  build() {
    Row() {
      Column({space:20}) {
        Button(`学习button`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Button('默认按钮样式')

        // 接口参数
        Button('圆形按钮', { type: ButtonType.Circle })
          .width(100)
        Button('矩形按钮', { type: ButtonType.Normal })
          .width(100)
          .borderRadius(20)
        Divider()
        Button('按压状态1', { type: ButtonType.Normal , stateEffect:true})
          .width(100)
        Divider()
        Button('按压状态2', { type: ButtonType.Normal , stateEffect:false})
          .width(100)

        Divider()
        Button(){
          Image($r('app.media.back'))
            .width(50)
            .height(20)
            .objectFit(ImageFit.Contain)
        }
        .width(80)
        .height(30)
        .onClick(() => {
          router.back()
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}