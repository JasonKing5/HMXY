/*
 * 页面间转场第二种效果第二个页面
 *
 * */
@Entry
@Component
struct PageTransition2To {
  @State scale2: number = 1
  @State opacity2: number = 1

  build() {
    Column({ space: 10 }) {
      // 点击跳转
      Navigator({target:'pages/PageTransition2',type:NavigationType.Push}) {
        Image($r('app.media.bg3')).width('100%').height('100%')
      }
      .scale({ z: this.scale2 }).opacity(this.opacity2)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  //   自定义转场效果
  pageTransition() {
    PageTransitionEnter({ duration: 1200, curve: Curve.Linear })
      // 进场过程中会逐帧触发onEnter回调，入参为动效的归一化进度(0% --- 100%)
      .slide(SlideEffect.Right)
    PageTransitionExit({ duration: 1500, curve: Curve.Ease })
      .translate({x:200,y:200})
      .opacity(0)
  }
}