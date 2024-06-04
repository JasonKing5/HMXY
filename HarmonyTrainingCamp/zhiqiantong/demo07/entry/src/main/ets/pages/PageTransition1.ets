/*
 * 页面间转场：
 * 在全局pageTransition方法内配置页面入场和页面退场时的自定义转场动效。
 *    PageTransitionEnter:进场
 *    PageTransitionExit：退场
 *  配置当前页面的入场动画为淡入，退场动画为缩小
 * */
import router from '@ohos.router'

@Entry
@Component
struct PageTransition1 {
  @State scale1: number = 1 //缩放倍数
  @State opacity1: number = 1 // 透明度
  build() {
    Column({ space: 10 }) {
      Image($r('app.media.bg1'))
        .scale({ x: this.scale1})
        .opacity(this.opacity1)
        .onClick(() => {
          router.pushUrl({ url: 'pages/PageTransition1To' })
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  //   页面间转场
  pageTransition() {
    //   进场转场动效 :progress 0-1  0%-100%
    PageTransitionEnter({ duration: 2000, curve: Curve.Linear }).onEnter((type: RouteType, progress: number) => {
      this.scale1 = progress
      this.opacity1 = progress
    })
    //   退场转场动效
    PageTransitionExit({ duration: 2000, curve: Curve.Linear }).onExit((type: RouteType, progress: number) => {
      this.scale1 = 1 - progress
      this.opacity1 = 1 - progress
    })

  }
}
