import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = '首屏'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            router.pushUrl({url:'pages/two'})
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}