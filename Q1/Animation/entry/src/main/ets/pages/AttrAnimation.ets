// 属性动画
@Entry
@Component
struct AttrAnimation {
  @State widthSize: number = 250
  @State heightSize: number = 100
  @State rotateAngle: number = 0
  @State flag: boolean = true

  build() {
    Column() {
      Button('change size')
        .onClick(() => {
          if (this.flag) {
            this.widthSize = 150
            this.heightSize = 50
          }else{
            this.widthSize = 250
            this.heightSize = 100
          }
          this.flag = !this.flag
        })
        .margin(30)
        .width(this.widthSize)
        .animation({
          duration:2000,
          iterations:3,
          curve:Curve.Linear,
          playMode:PlayMode.Alternate
        })
        .height(this.heightSize)
        .animation({
          duration:1000,
          // iterations:-1,
          curve:Curve.Linear,
          playMode:PlayMode.Alternate
        })

      Button('change rotate angle')
        .onClick(() => {
          this.rotateAngle = 90
        })
        .margin(50)
        .rotate({angle:this.rotateAngle})
        .animation({
          duration:1000,
          iterations:-1,
          curve:Curve.Linear,
          playMode:PlayMode.Alternate
        })

    }.width('100%').margin({ top: 20 })
  }
}