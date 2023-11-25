// src/main/ets/pages/Column.ets
@Entry
@Component
struct ColumnExample {
  build() {
    Column({ space: 10 }) {
      Column() {
        Column().width('50%').height(30).backgroundColor(Color.Blue)
        Column().width('60%').height(40).backgroundColor(Color.Brown)
      }
      .width('90%')
      .height(100)
      .border({width: 1, color: Color.Red})
      .alignItems(HorizontalAlign.End)
      .justifyContent(FlexAlign.SpaceAround)

      Row() {
        Row().width('30%').height(50).backgroundColor(Color.Blue)
        Row().width('40%').height(70).backgroundColor(Color.Brown)
      }
      .width('90%')
      .height(100)
      .border({width: 1, color: Color.Red})
      .alignItems(VerticalAlign.Bottom)
      .justifyContent(FlexAlign.SpaceAround)

      Flex({
        direction: FlexDirection.Row,
        justifyContent: FlexAlign.SpaceAround,
        alignItems: ItemAlign.Start,
        wrap: FlexWrap.Wrap,
        alignContent: FlexAlign.SpaceEvenly

      }) {
        Text('1').width('5%').height(50).backgroundColor(0xF5DEB3)
        Text('2').width('20%').height(60).backgroundColor(0xD2B48C)
        Text('3').width('30%').height(70).backgroundColor(0xF5DEB3)
        Text('4').width('15%').height(55).backgroundColor(0xD2B48C)
        Text('5').width('20%').height(60).backgroundColor(0xD2B48C)
        Text('6').width('50%').height(70).backgroundColor(0xD2B48C)
        Text('7').width('15%').height(55).backgroundColor(0xD2B48C)
      }
      .height(160)
      .width('90%')
      .backgroundColor(0xAFEEEE)
    }
    .margin(20)
  }
}