@Entry
@Component
struct Index {

  @State message: string = 'Hello World'

  build() {
    Column() {
      Column() {
        Button("click")
          .width("175.18vp")
          .height("54.67vp")
          .offset({ x: "-0.08vp", y: "-302.05vp" })
          .fontColor(Color.White)
          .fontSize("30fp")
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.icon'))
          .width("200vp")
          .height("200vp")
          .offset({ x: "16.58vp", y: "-112.98vp" })
        Refresh({ friction: 62, offset: "16vp", refreshing: false })
          .width("79.92%")
          .height("45.01vp")
        Text(`${this.message}`)
          .width("300vp")
          .height("60vp")
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
          .fontWeight(FontWeight.Bold)
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
  }
}