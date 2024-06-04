/*
 * 属性动画
 *        duration: 1200,  设置动画时长，默认1000
          curve: Curve.Friction,  设置动画曲线
          delay: 500,             延迟时间
          iterations: -1, // 设置-1表示动画无限循环
          playMode: PlayMode.Alternate    // 播放模式，PlayMode.Alternate奇数正向播放，偶数反向播放
 * */

@Entry
@Component
struct AttrAnimation {
  @State widthSize: number = 250
  @State heightSize: number = 100

  build() {
    Column({ space: 10 }) {
      Button('change size...')
        .width(this.widthSize)
        .height(this.heightSize)
        .onClick(()=>{
          this.widthSize = 150
          this.heightSize = 60
        })
        .animation({
          duration:2000,
          curve:Curve.Linear,
          // delay:1000
          iterations:-1,
          playMode:PlayMode.Alternate
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}