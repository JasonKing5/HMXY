@Component
export default struct ShowPoem {
  @Prop poem: string
  @Prop author: string
  @Prop subject: string

  build() {
    Row({ space: 30 }) {
      Row() {
        Text(this.author)
          .textStyle()
      }
      .authorArea()

      Row({ space: 30 }) {
        Text(this.poem)
          .textStyle()
          .height('100%')
        Text(this.subject)
          .textStyle()
      }
      .height('100%')
      .alignItems(VerticalAlign.Top)
    }
    .poemArea()
  }
}

@Extend(Text)
function textStyle() {
  .fontSize(20)
  .width(20)
}

@Extend(Row)
function authorArea() {
  .width(20)
  .height('100%')
  .alignItems(VerticalAlign.Bottom)
}

@Extend(Row)
function poemArea() {
  .width('80%')
  .height('70%')
  .backgroundColor('#fff1d7d7')
  .padding(30)
  .borderRadius(10)
  .justifyContent(FlexAlign.SpaceBetween)
}
