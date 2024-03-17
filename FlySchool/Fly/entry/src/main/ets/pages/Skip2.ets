import router from '@ohos.router'

@Entry
@Component
struct Skip2 {
  @State message: string = '第二个页面'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
    .onClick(() => {
      router.back()
    })
  }
}