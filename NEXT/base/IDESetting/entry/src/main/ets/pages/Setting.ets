import { router } from '@kit.ArkUI'

@Entry
@Component
struct Setting {

  build() {
    Column({ space: 30 }) {
      Button()
        .onClick(() => {


        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}

