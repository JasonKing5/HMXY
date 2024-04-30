@Entry
@Component
struct Index {

  @State message: string = '低代码'

  build() {
    Column() {
      Column() {
        Checkbox()
          .width("60vp")
          .height("60vp")
          .offset({ x: "109.83vp", y: "-279.98vp" })
          .margin({ top: "12vp", bottom: "12vp", left: "12vp", right: "12vp" })
        Button()
          .width("114.5vp")
          .height("39.79vp")
          .offset({ x: "55.18vp", y: "-152.1vp" })
          .fontColor(Color.White)
        Image($r('app.media.startIcon'))
          .width("105.46vp")
          .height("93.72vp")
          .offset({ x: "-107.44vp", y: "-212.25vp" })
        Divider()
          .width("100%")
          .height("1vp")
          .offset({ x: "-42.88vp", y: "-190.04vp" })
        DatePicker()
          .width("200vp")
          .height("200vp")
          .offset({ x: "-53.55vp", y: "-166.44vp" })
        Refresh({ friction: 62, offset: "16vp", refreshing: false })
          .width("47.04%")
          .height("65.63vp")
          .offset({ x: "5.36vp", y: "-100.25vp" })
          .backgroundColor("#e42525")
        Text(`${this.message}`)
          .width("300vp")
          .height("60vp")
          .fontColor("#d33636")
          .textAlign(TextAlign.Center)
          .decoration({ type: TextDecorationType.LineThrough, color: "#288f6d" })
          .fontSize("26fp")
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Normal)
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
  }
}