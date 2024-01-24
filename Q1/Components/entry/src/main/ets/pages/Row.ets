@Entry
@Component
struct RowExample {
  @State name1: string = '帝心'
  @State name2: string = '庄生'

  build() {
    Row({ space: 20}) {
      Column() {
        Text(this.name1)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('30%')
      .backgroundColor(Color.Grey)

      Column() {
        Text(this.name2)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('30%')
      .backgroundColor(Color.Yellow)
    }
    .width('100%')
    .height('20%')
    .alignItems(VerticalAlign.Bottom)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.Orange)
  }
}