// 项目入口：加载页面
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  // 倒计时
  @State second: number = 4
  // 图标旋转效果
  @State angleVal: number = 0

  aboutToAppear(): void {
    let timerID = setInterval(() => {
      this.second--
      if (this.second === 1) {
        clearInterval(timerID)
        // 页面跳转
        router.replaceUrl({
          url: "pages/MainPoem"
        })
      }
      // 图标旋转角度改变
      animateTo({
        duration: 500, // 动画的持续时间
        curve: Curve.Linear, // 动画的曲线速率
        iterations: -1  // 一直转，旋转次数
      }, () => {
        this.angleVal += 360
      })

    }, 1000)
  }

  build() {
    Column({ space: 30 }) {
      Text() {
        Span('还有')
        Span(`${this.second}`)
          .fontSize(20)
          .fontColor('#ffb51cec')
        Span('秒钟进入主页')
      }
      .fontSize(16)
      .offset({ x: 100 })

      Image($r('app.media.logo'))
        .width('50%')
        .rotate({
          // x:1,
          // y:1,
          // z:1,
          angle: this.angleVal
        })

      // Text($r('app.string.EntryAbility_desc'))
      //   .fontSize(20)
      //   .width(240)
      //   .maxLines(1)
      //   .textOverflow({overflow:TextOverflow.MARQUEE})

      Marquee({ start: true, src: '劝君莫负少年志 曾许人间第一流' })
        .fontSize(20)
        .width(240)

      Row({ space: 30 }) {
        Text(`开发者：帝心`)
          .fontSize(16)
          .fontColor('#ff0fbf94')
        Text(`版本：V1`)
          .fontSize(16)
          .fontColor('#ff0fbf94')
      }
    }
    .bjStyle()
  }
}

@Extend(Column)
function bjStyle() {
  .width('100%')
  .height('100%')
  .backgroundColor($r('app.color.theme_color'))
  .justifyContent(FlexAlign.SpaceBetween)
  .padding({
    bottom: 30,
    top: 20
  })
}
