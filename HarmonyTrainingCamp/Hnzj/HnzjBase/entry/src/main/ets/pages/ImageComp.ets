import router from '@ohos.router'

@Entry
@Component
struct ImageComp {
  @State message: string = router.getParams()?.['title'] || '图片'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}