// src/main/ets/pages/Column.ets
@Entry
@Component
struct ColumnExample {
  build() {
    Column({ space: 10 }) {


      Column() {
        Column().width('50%').height(30).backgroundColor(Color.Blue)
        Column().width('50%').height(30).backgroundColor(Color.Gray)
      }
      .width('90%')
      .border({width: 1, color: Color.Red})
      .alignItems(HorizontalAlign.Center)

      Column() {
        Column().width('80%').height(30).backgroundColor(Color.Blue)
        Column().width('80%').height(30).backgroundColor(Color.Gray)
      }
      .width('90%')
      .height(100)
      .border({width: 1, color: Color.Red})
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.SpaceAround)


      Text("alignItems:").fontSize(26).fontColor(0x3E3E3E).width('90%')
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(50).backgroundColor(0x00FFFF)
      }.width('90%').alignItems(VerticalAlign.Top).height('15%').border({ width: 1 })

      Text("justifyContent:").fontSize(26).fontColor(0x3E3E3E).width('90%')
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        Row().width('30%').height(50).backgroundColor(0x00FFFF)
      }.width('90%').border({ width: 1 }).justifyContent(FlexAlign.SpaceBetween)
    }
    .margin(20)
  }
}