import router from '@ohos.router'
import Constants from '../common/Constants'
import Title from '../view/Title'

@Entry
@Component
struct Index {
  @State countdown: number = Constants.countdown
  @State angleVal: number = 0

  aboutToAppear() {
    // 定时执行
    let timerId: number = setInterval(() => {
      this.countdown--
      if (this.countdown === 0) {
        //停止定时器。  建议停止
        clearInterval(timerId)
        // 跳转页面
        router.pushUrl({
          url:"pages/Main"
        })
      }

      // 动画效果。
      animateTo({
        curve: Curve.Linear,
        duration:1000,
        iterations:-1
      }, () => {
        this.angleVal = 360
      })
    }, 1000)
  }

  build() {
    Column({ space: 30 }) {
      Row() {
        Blank()
        Text(this.countdown + '秒进入')
          .fontSize(30)
      }
      .width('100%')
      .height(50)
      .backgroundColor('#eee')

      Blank()
      Image($rawfile('loading.jpg'))
        .width('40%')
        .borderRadius(90)
        .opacity(.5)
        .rotate({
          angle: this.angleVal
        })
      Blank()

      Title()

      Blank()

      Text($r('app.string.origin'))
        .fontSize(20)
        .fontColor('#fff38406')
      Blank()

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}