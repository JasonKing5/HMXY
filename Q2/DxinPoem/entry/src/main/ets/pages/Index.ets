/*
 * 诗词应用首页。
 * */
@Entry
@Component
struct Index {
  @State message: string = '帝心诗词应用首页';

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
  }
}