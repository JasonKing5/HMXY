// common/Width.ets
@Entry
@Component
struct WidthExample {
  build() {
    Column() {
      Text("margin and padding:").fontSize(26).fontColor(0x3E3E3E).width('90%')

      Row() {
        Text("锦瑟无端五十弦，一弦一柱思华年。").fontSize(26).fontColor(0x3E3E3E).width('90%')
      }
      .backgroundColor(Color.Blue)

      Row() {
        Text("帝心").fontSize(26).fontColor(0x3E3E3E).backgroundColor(Color.Blue).height(260)
        Row() {
          Row() {
            Text("帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心帝心").fontSize(26).fontColor(0x3E3E3E).width('90%')
          }
        }
        .width(200)
        .height(200)
        .padding(20)
        .margin({ top: 30, bottom: 30, left: 20, right: 0})
        .border({width: 10, color: Color.Red})
        .backgroundColor(Color.Gray)
        Text("庄生").fontSize(26).fontColor(0x3E3E3E).backgroundColor(Color.Blue)
      }


      Row() {
        Text("庄生晓梦迷蝴蝶，望帝春心托杜鹃。").fontSize(26).fontColor(0x3E3E3E).width('90%')
      }
      .backgroundColor(Color.Blue)
    }
  }
}
