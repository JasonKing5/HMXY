import router from '@ohos.router'

@Entry
@Component
struct TextComp {
  @State message: string = router.getParams()?.['title'] || '文本组件学习'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}
