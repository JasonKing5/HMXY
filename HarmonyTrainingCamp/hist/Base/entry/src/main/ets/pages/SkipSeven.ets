@Entry
@Component
struct SkipSeven {
  @State count: number = 69

  build() {
    Column({ space: 30 }) {
      if (this.count % 7 == 0 || this.count.toString().includes('7')) {
        Text('过儿')
          .fontSize(60)
          .fontColor(Color.Red)
      } else {
        Text(this.count + '').fontSize(40)
      }

      Button('逢七过小游戏')
        .onClick(() => {
          this.count++
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}