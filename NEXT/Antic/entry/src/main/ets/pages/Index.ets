@Entry
@Component
struct Index {
  @State message: string = '鸿蒙小技巧系列';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Row() {
        }

        Row() {
        }
        .width(200)
        .height(200)
        .borderWidth({ bottom: 8, })
        .borderColor({ bottom: Color.Green}
        )
        // .border({width:{bottom:8},color:'rgb(255, 141, 249)',style:BorderStyle.Solid})

        .borderStyle(BorderStyle.Solid)
        .borderRadius(100)
      }
      .width('100%')
    }
    .height('100%')
  }
}