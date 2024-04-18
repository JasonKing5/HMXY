import router from '@ohos.router'

@Entry
@Component
struct Two {
  build() {
    Column({space:40}) {
      Text('222')
        .fontSize(30)
        .fontColor(Color.Green)

      Divider()
        .strokeWidth(10)
        .color('red')

      Image($r('app.media.logo'))
        .width(200)
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe8eeee')
  }
}