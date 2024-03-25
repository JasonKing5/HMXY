@Entry
@Component
struct AnimationStudy {
  @State message: string = '动画'
  @State myAngle: number = 0
  @State myOpacity: number = 1
  @State fs: number = 50

  build() {
    Row() {
      Column({ space: 30 }) {
        Text(this.message)
          .fontSize(this.fs)
          // .animation({
          //   duration: 3000,
          //   curve: Curve.Linear,
          //   // delay:2000,
          //   iterations: 2,
          //   playMode: PlayMode.Alternate
          // })
          .fontWeight(FontWeight.Bold)
          .rotate({
            angle: this.myAngle
          })
          .opacity(this.myOpacity)
          .animation({
            duration: 2000,
            curve: Curve.Linear,
            // delay:2000,
            iterations: 1,
            playMode: PlayMode.Alternate
          })

        Button('动画入门之属性动画')
          .onClick(() => {
            this.myAngle = 360
            this.myOpacity = .1
            this.fs = 80
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}