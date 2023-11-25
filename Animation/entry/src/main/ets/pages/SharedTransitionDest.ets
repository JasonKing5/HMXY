// dest page
import router from '@ohos.router';
@Entry
@Component
struct SharedTransitionDest {
  build() {
    Column({ space: 30 }) {

      Text('致敬pink').opacity(1).fontSize(20).fontColor(Color.Pink)
        .sharedTransition('text',{
          duration:2000,
          curve:Curve.Linear,
          type:SharedTransitionEffectType.Static
        })

      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Image($r('app.media.bg'))
        .width(150)
        .height(150)
        .opacity(1)
        .borderRadius(75)
        .sharedTransition('sharedImage1',{
          duration:2000,
          curve:Curve.Linear,
          type:SharedTransitionEffectType.Exchange
        })
    }
    .width("100%")
    .height('100%')
    .padding(30)
    .onClick(() => {
      router.back()
    })
  }
}