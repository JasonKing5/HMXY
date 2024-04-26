@Entry
@Component
struct Index {
  // 设置注释的颜色
  @State message: Resource = $r('app.string.appName')

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
  }
}