/*
 * 页面间共享元素，第二个页面
 * */
@Entry
@Component
struct TransitionTo {
  build() {
    Column() {
      Text('two')
      Image($r('app.media.bg1')).width(150).height(150)
        .sharedTransition('sharedImage',
          {
            duration: 1000,
            curve: Curve.Linear,
            delay: 100
          })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.End)
  }
}