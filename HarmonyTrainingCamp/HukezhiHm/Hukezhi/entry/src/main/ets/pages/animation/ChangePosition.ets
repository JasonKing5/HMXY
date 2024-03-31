@Entry
@Component
struct ChangePosition {
  @State weizhi: FlexAlign = FlexAlign.Start
  @State title:string  = '改变位置动画'
  @State myOpacity:number  = .3

  @State myAngle:number = 0

  @State bgc:Color = Color.Brown

  build() {
    Column({ space: 20 }) {
      Text(this.title)
        .opacity(this.myOpacity)
      Row() {
        Button('湖科职')
          .rotate({angle:this.myAngle})
      }

      .width('80%')
      .height(250)
      .borderWidth(1)
      .justifyContent(this.weizhi)


      Button('change')
        .onClick(() => {

          animateTo({
            duration: 1000,
            // delay:2000,
            curve:Curve.Linear,
            iterations:3,
            playMode:PlayMode.Alternate,
            onFinish: () => {
              this.title = '结束啦！！！'
            }
          }, () => {
            this.weizhi = FlexAlign.Center
            this.myOpacity = 1
            this.bgc = Color.Yellow
            this.myAngle = 360
          })
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.bgc
    )
  }
}