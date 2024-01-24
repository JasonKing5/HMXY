// src page
import router from '@ohos.router'
@Entry
@Component
struct SharedTransitionSrc {
  build() {
    Column({ space: 30 }) {

      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Image($r('app.media.bg'))
        .width(50)
        .height(50)
        .opacity(.2)
        .borderRadius(25)
        .sharedTransition('sharedImage1',{
          duration:2000,
          curve:Curve.Linear,
          type:SharedTransitionEffectType.Exchange
        })
    }
    .width("100%")
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .padding(30)
    .onClick(() => {
      router.pushUrl({
        url:"pages/SharedTransitionDest"
      })
    })
  }
}