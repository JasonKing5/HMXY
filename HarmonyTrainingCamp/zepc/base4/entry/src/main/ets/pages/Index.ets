@Entry
@Component
struct Index {
  message: Resource = $r('app.string.title')

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontColor('green')
          .fontSize(30)
          .fontWeight(700)
          .fontStyle(FontStyle.Italic)

        Button('click')
          .width('50%')
          .height(50)
          .backgroundColor('#74011a14')
      }
      .width('100%')
    }
    .height('100%')
  }
}