import router from '@ohos.router'

@Entry
@Component
struct PageTransitionDest {
  @State scale1: number = 1
  @State opacity1 : number = 1
  build() {
    Column({ space: 30 }) {
      Text('dest...')
        .fontSize(50)
        .opacity(this.opacity1)

      Image($r('app.media.bg2'))
        .width('100%')
        .height('100%')
        .scale({ y: this.scale1 })
        .opacity(this.opacity1)
    }
    .width('100%')
    .height('100%')
    .onClick(() => {
      router.back()
    })
  }

  pageTransition() {
    // 进场效果
    PageTransitionEnter({ duration: 2000, curve: Curve.Linear })
      // progress : 动画归一数据  0 ----- 1
      .onEnter((type: RouteType, progress: number) => {
        this.scale1 = progress
        this.opacity1 = progress
      })
    // 退场效果。
    PageTransitionExit({ duration: 2000 })
      .onExit((type: RouteType, progress: number) => {
        this.scale1 = 1 - progress
        this.opacity1 = 1 - progress
      })
  }
}