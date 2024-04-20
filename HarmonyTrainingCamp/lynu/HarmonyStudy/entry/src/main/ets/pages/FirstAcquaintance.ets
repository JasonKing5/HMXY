// 初识鸿蒙的arkts语言，学习入门

// 自定义自定义组件
@Entry
@Component
struct FirstAcquaintance {
 @State message: string = '初识鸿蒙'

  build() {
    // 系统组件
    Row() {
      Column() {
        Text(this.message)//属性样式
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .opacity(1)
          .fontColor('red')


        Divider()

        Button('按钮')
          .width('40%')
          .height(60)//   行为，事件函数。具备什么功能。
          .onClick(() => {
            this.message = '鸿蒙之父'
          })
        // ctrl+alt + l
        //   ctrl+/
      // ctrl+y 删除当前行，第一你们用的时候，会弹窗提示，问是不是要delete line
      }
      .width('100%')
    }
    .height('100%')
  }
}

