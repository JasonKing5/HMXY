import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = '航空之城';

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bolder)
        Divider()
        Image($r('app.media.lyf'))
          .width('50%')
          .onClick(() => {
            router.pushUrl({
              url:"pages/Skip1"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}