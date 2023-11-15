// 劝君莫惜金缕衣 劝君惜取少年时
@Entry
@Component
struct Index {
  @State message: string = '劝君莫惜金缕衣 劝君惜取少年时'

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
  }
}