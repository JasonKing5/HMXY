@Entry
@Component
struct AnimationStudy1 {
  @State message: string = '显式动画'
  @State myAngle: number = 60
  flag: boolean = false

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Image($r('app.media.logo'))
          .width('80%')
          .rotate({
            x: 1,
            y: 1,
            z: 1,
            angle: this.myAngle
          })
        Button('显式动画')
          .onClick(() => {
            animateTo({
              // iterations:-1
            }, () => {
              if (this.flag) {
                this.myAngle = 60
              }else{
                this.myAngle = 360
              }
            })
              this.flag = !this.flag
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}