// src/main/ets/pages/basic/Button.ets
@Entry
@Component
struct ButtonExample {
  build() {
    Column({ space: 10 }) {
      Row() {
        Button({type: ButtonType.Normal, stateEffect: false}) {
          Row() {
            LoadingProgress().width(20).height(20).color(Color.White)
            Text("帝心").fontSize(26).fontColor(Color.White)
          }
        }
        .backgroundColor(Color.Gray).opacity(0.4)

        Button('帝心1', {type: ButtonType.Normal, stateEffect: false})
      }
    }
    .margin(20)
  }
}