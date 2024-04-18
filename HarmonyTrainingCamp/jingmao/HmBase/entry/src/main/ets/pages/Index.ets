@Entry
@Component
struct Index {
  @State message: string = '何事人间频乞食物，此心已是负彩霞'

  build() {
    Column({space:30}) {
      Text(this.message)

      Text("帝心")
      Text("马园威")
      Text(`鸿蒙之父`)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe8eeee')
    // 设置主轴位置 此时y
    // .justifyContent(FlexAlign.Start)
    .justifyContent(FlexAlign.Center)
    // .justifyContent(FlexAlign.SpaceBetween)
    // .justifyContent(FlexAlign.SpaceEvenly)
  //   设置侧轴位置 默认居中
    .alignItems(HorizontalAlign.Center)

  }
}