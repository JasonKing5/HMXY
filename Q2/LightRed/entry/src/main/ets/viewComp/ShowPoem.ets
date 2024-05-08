import Poem from '../model/Poem'

@Component
export default struct ShowPoem {
  @Prop poem:Poem

  build() {
    Row({ space: 30 }) {
      Row() {
        Text(this.poem.author)
          .textStyle()
      }
      .authorArea()

      Row({ space: 30 }) {
        Text(this.poem.content)
          .textStyle()
          .height('100%')
        Text(this.poem.subject)
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
  .height('96%')
  .backgroundColor('#ffb9f1cb')
  .padding(30)
  .borderRadius(10)
  .justifyContent(FlexAlign.SpaceBetween)
}
