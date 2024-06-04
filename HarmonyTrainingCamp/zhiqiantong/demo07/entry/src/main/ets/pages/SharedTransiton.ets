/*
 * 页面间共享元素转场，所以两个页面应该有同一个共享元素存在。
 * sharedTransition(id, { })  id必须给，不为空的字符串。两个页面id相同才能共享
 * */
@Entry
@Component
struct SharedTransiton {

  build() {
    Column({ space: 10 }) {
      Text('one')
      Navigator({ target: 'pages/TransitionTo', type: NavigationType.Push }) {
        Image($r('app.media.bg1')).width(50).height(50).rotate({ x: 1, angle: 45 })
          .sharedTransition('sharedImage', { duration: 1000, curve: Curve.Linear, delay: 100 })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}