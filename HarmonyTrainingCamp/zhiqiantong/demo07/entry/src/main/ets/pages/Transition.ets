/*
 * 组件内转场。
 *  需要配合animateTo()
 * */
@Entry
@Component
struct Transition {
  @State flag: boolean = true

  build() {
    Column({ space: 10 }) {
      Button(this.flag ? '隐藏' : '显示').width(80).height(30).margin(30)
        .onClick(() => {
          //    点击按钮控制图片的显示和隐藏
          animateTo({ duration: 2000 }, () => {
            this.flag = !this.flag
          })
        })
      if (this.flag) {
        Image($r('app.media.bg1')).width(300)
          .transition({ type: TransitionType.Insert, scale: { x: 0, y: 0, z: 0 } })
          .transition({ type: TransitionType.Delete, rotate: { angle: 180 } })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}