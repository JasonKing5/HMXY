// 属性动画
@Entry
@Component
struct Animation2 {
  @State myWidth: number | string = '50%'
  @State myHeight: number = 50
  @State myAngle: number = 0
  @State myOpacity: number = .5
  @State flag:boolean  =  false

  build() {
    Row() {
      Column() {
        Button('改变各种样式')
          .width(this.myWidth)
          .animation({
            duration:3000,
            iterations:3,
            playMode:PlayMode.Alternate
          })
          .height(this.myHeight)
          .animation({
            duration:3000,
            iterations:-1,
            playMode:PlayMode.Alternate
          })
          .rotate({ angle: this.myAngle })
          .animation({
            duration:1000,
            iterations:-1,
            playMode:PlayMode.Alternate
          })
          .opacity(this.myOpacity)
          .animation({})


      }
      .width('100%')
    }
    .height('100%')
    .onClick(() => {
      if (this.flag) {
        this.myOpacity = 1
        this.myWidth = '80%'
        this.myHeight = 100
        this.myAngle = 360
      }else{
        this.myOpacity = 0
        this.myWidth = '50%'
        this.myHeight = 50
        this.myAngle = 0
      }
     this.flag = !this.flag
    })
  }
}