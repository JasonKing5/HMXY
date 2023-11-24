// common/Position.ets
@Entry
@Component
struct PositionExample {
  build() {
    Column({ space: 10 }) {
      Column({ space: 10 }) {
        Text("align:").fontSize(26).fontColor(0x3E3E3E).width('90%')
        Stack() {
          Text("first").fontSize(26).fontColor(0x3E3E3E).height(70).backgroundColor(Color.Orange)
          Text("second").fontSize(26).fontColor(0x3E3E3E).height(30).backgroundColor(Color.Gray)
        }
        .width('90%')
        .height(100)
        .backgroundColor(Color.Blue)
        .align(Alignment.Bottom)
      }

      Column({ space: 10 }) {
        Text("direction:").fontSize(26).fontColor(0x3E3E3E).width('90%')
        Row() {
          Text("1").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Blue)
          Text("2").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Brown)
          Text("3").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Green)
          Text("4").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Orange)
        }
        .width('90%')
        .height(100)
        .backgroundColor(Color.Grey)
        .direction(Direction.Rtl)
      }

      Column({ space: 10 }) {
        Text("position:").fontSize(26).fontColor(0x3E3E3E).width('90%')

        Row() {
          Text("1").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Blue)
          Text("2").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Brown)
            .position({x: 30, y: 10})
          Text("3").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Green)
          Text("4").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Orange)
            .position({x: '70%', y: '70%'})
        }
        .width('90%')
        .height(100)
        .border({width: 1})
      }

      Column({ space: 10 }) {
        Text("mark:").fontSize(26).fontColor(0x3E3E3E).width('90%')
        Stack({ alignContent: Alignment.TopStart}) {
          Row() {

          }
          .width(100)
          .height(100)
          .backgroundColor(Color.Yellow)

          Text("1").fontSize(26).fontColor(0x3E3E3E).width('25').height(25).backgroundColor(Color.Blue)
            .markAnchor({x: 25, y: 10})
          Text("2").fontSize(26).fontColor(0x3E3E3E).width('25').height(25).backgroundColor(Color.Brown)
            .markAnchor({x: -100, y: -50})
          Text("3").fontSize(26).fontColor(0x3E3E3E).width('25').height(25).backgroundColor(Color.Green)
            .markAnchor({x: 25, y: -60})
        }
      }

      Column({ space: 10 }) {
        Text("offset:").fontSize(26).fontColor(0x3E3E3E).width('90%')

        Row() {
          Text("1").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Blue)
          Text("2").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Brown)
            .offset({x: 30, y: 20})
          Text("3").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Green)
          Text("4").fontSize(26).fontColor(0x3E3E3E).width('25%').backgroundColor(Color.Orange)
            .offset({x:'-40%', y: -20})
        }
        .width('90%')
        .height(100)
        .border({width: 1})
      }
    }
  }
}