/*
 * 页面间转场效果 第二种，滑动入场  缩小和透明退场
 * */
@Entry
@Component
struct PageTransition2 {
  @State scale1: number = 1
  @State opacity1: number = 1

  build() {
    Column({ space: 10 }) {
      Navigator({ target: 'pages/PageTransition2To', type: NavigationType.Push }) {
        Image($r('app.media.bg2')).width('100%').height('100%')
      }
      .scale({ y: this.scale1 }).opacity(this.opacity1)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  pageTransition(){
    PageTransitionEnter({ duration:2000 })
      .slide(SlideEffect.Left)    //左侧滑入

    PageTransitionExit({ delay:100 })
      .translate({x:100,y:100})
      .opacity(0)
  }

}