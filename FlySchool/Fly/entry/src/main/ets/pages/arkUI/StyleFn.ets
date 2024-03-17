@Entry
@Component
struct StyleFn {
  build() {
    Column({space:20}) {
      Text('text').stylesFn()
        .fontSize(30)
        .fontColor('red')
        .fontStyle(FontStyle.Italic)
      Image('').stylesFn()
      Button('btn').stylesFn()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

// 所有组件通用样式函数  但是只能写通用样式
@Styles
function stylesFn() {
  .width('50%')
  .height(50)
  .backgroundColor(Color.Green)
}