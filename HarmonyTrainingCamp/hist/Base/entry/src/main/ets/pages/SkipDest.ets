// 页面跳转demo的第二个页面 目的页面
import router from '@ohos.router'

@Entry
@Component
struct SkipDest {
  @State myName: string = '鸿蒙之父'

  build() {
    Row() {
      Column() {
        Text(this.myName)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text('<<<<')
          .fontSize(50)
          .fontColor('red')
          .onClick(() => {
            router.back()
          })


      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#ffc6e9de')
  }
}