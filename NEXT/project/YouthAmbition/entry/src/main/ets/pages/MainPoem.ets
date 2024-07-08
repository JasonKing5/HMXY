import PoemTitle from '../view/PoemTitle'

@Entry
@Component
struct MainPoem {
  build() {
    Column({ space: 30 }) {
      PoemTitle()

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}

