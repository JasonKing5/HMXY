/*
 * 状态样式其实是一个属性方法。
 * */
@Entry
@Component
struct StateStyleFun {
  @State message: string = 'stateStyles()'

  build() {
    Row() {
      Column() {
        // Button('哥们，我先来的。焦点在我这呢。')
        // 临时加个输入框，获焦效果更明显
        // TextInput()
        //   .border({ color: Color.Orange, width: 2 })
        //   .margin(20)

        Text('文本不能获焦')
        Button(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .stateStyles({
            normal:{
              .backgroundColor(Color.Red)
            },
            focused:{
              .backgroundColor(Color.Pink)
            },
            pressed:{
              .backgroundColor(Color.Blue)
            }
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}