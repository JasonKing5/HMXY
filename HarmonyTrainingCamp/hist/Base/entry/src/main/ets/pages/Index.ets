@Entry
@Component
struct Index {
  // 设置注释的颜色
  @State message: string = '日拱一卒无有尽，功不唐捐终入海'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#ffc6e9de')
  }
}