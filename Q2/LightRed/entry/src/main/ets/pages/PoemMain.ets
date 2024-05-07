import LogoAndTitle from '../viewComp/LogoAndTitle'

@Entry
@Component
struct PoemMain {
  build() {
    Column({ space: 30 }) {
        LogoAndTitle()
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))

  }
}