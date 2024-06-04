/*
 * 页面间转场的第二个页面
 * */
import router from '@ohos.router'

@Entry
@Component
struct PageTransition1To {
  @State scale2: number = 1 //缩放倍数
  @State opacity2: number = 1 // 透明度
  build() {
    Column({ space: 10 }) {
      Image($r('app.media.bg2'))
        .scale({ y: this.scale2 })
        .opacity(this.opacity2)
        .onClick(() => {
          router.pushUrl({ url: 'pages/PageTransition1' })
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
      this.scale2 = progress
      this.opacity2 = progress
    })
    //   退场转场动效
    PageTransitionExit({ duration: 2000, curve: Curve.Linear }).onExit((type: RouteType, progress: number) => {
      this.scale2 = 1 - progress
      this.opacity2 = 1 - progress
    })
  }
}