// 装饰器的学习：state prop link
import router from '@ohos.router'

@Entry
@Component
struct Decorators {
  @State message: string = router.getParams()?.['title'] || '状态装饰器'

  build() {
    Column({ space: 30 }) {
      Text(this.message).fontSize(20)
      Divider().strokeWidth(4)
      Button('change message')
        .onClick(() => {
          this.message = 'state'
        })

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}