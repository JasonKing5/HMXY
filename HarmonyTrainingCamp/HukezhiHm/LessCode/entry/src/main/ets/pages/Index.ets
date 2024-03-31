import router from '@ohos.router'

@Entry
@Component
struct Index {

  @State message: string = 'Hello World'

  build() {
    Column() {
      Column() {
        Checkbox()
          .width("60vp")
          .height("60vp")
          .offset({ x: "-24.19vp", y: "-134.56vp" })
          .margin({ top: "12vp", bottom: "12vp", left: "12vp", right: "12vp" })
        DatePicker()
          .width("200vp")
          .height("200vp")
          .offset({ x: "-10.47vp", y: "-118.78vp" })
        Refresh({ friction: 62, offset: "16vp", refreshing: false })
          .width("100%")
          .height("100vp")
        Row() {
          Image($r('app.media.icon'))
            .width("58.5vp")
            .height("73.95vp")
            .offset({ x: "9.36vp", y: "-0.09vp" })
          Text("edeeee")
            .width("200vp")
            .height("60vp")
            .offset({ x: "101.5vp", y: "-0.07vp" })
            .fontColor(Color.Black)
            .fontSize("17fp")
        }        
        .width("360vp")
        .height("90.8vp")
        Text(`${this.message}`)
          .width("300vp")
          .height("60vp")
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
          .fontWeight(FontWeight.Bold)
        Button("点我一下")
          .width("200vp")
          .height("80.62vp")
          .offset({ x: "-7.47vp", y: "72.34vp" })
          .backgroundColor("#8f2d2d")
          .fontColor(Color.White)
          .margin({ top: "30vp" })
          .type(ButtonType.Normal)
          .stateEffect(true)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .onClick(this.goto.bind(this))
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
  }
  goto(){
    router.pushUrl({
      url: "pages/Two"
    })
  }
}