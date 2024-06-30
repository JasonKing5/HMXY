@Entry
@Component
struct Hcia {
  build() {
    Column({ space: 30 }) {
      Video({
        src:$rawfile('video.mp4')
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}