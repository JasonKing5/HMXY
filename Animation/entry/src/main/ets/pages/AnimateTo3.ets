@Entry
@Component
struct AnimateTo3 {
  @State message: string = '角度改变动画'
  @State rotateAngle: number = 0
  @State flag: boolean = false

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Image($r('app.media.afterDixin'))
          .width(300)
          .height(300)
          .borderRadius(150)
          .rotate({
            x: 1,
            y: 1,
            z: 1,
            angle: this.rotateAngle
          })
          .onClick(() => {
            animateTo({
              duration: 2000,
              curve: Curve.Friction
            }, () => {
              if (this.flag) {
                this.rotateAngle = 0
              } else {
                this.rotateAngle = 640
              }
              this.flag = !this.flag
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}