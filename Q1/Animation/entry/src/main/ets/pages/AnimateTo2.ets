// 显示动画-尺寸变化
@Entry
@Component
struct AnimateTo2 {
  @State myWidth: number = 100
  @State myHeight: number = 50
  @State flag: boolean = false

  build() {
    Column({ space: 10 }) {
      Button("change:尺寸")
        .type(ButtonType.Normal)
        .width(this.myWidth)
        .height(this.myHeight)
        .margin(20)
      Button(this.flag ? '小小小' : '大大大')
        .fontSize(40)
        .margin(20)
        .onClick(() => {
          //   调用显示动画方法
          animateTo({ duration: 1000, curve: Curve.Ease }, () => {
            if (this.flag) {
              this.myWidth = 100
              this.myHeight = 50
            } else {
              this.myWidth = 300
              this.myHeight = 150
            }
            this.flag = !this.flag
          })
        })
    }
    .width("100%")
    .height("100%")
  }
}