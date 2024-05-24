@Entry
@Component
struct Index {
  @State message: string = '日拱一卒无有尽，功不唐捐终入海';

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
  }
}


