import router from '@ohos.router'

@Entry
@Component
struct Index {

  @State message: string = '低代码111'

  goTwo(){
    router.pushUrl({
      url:"pages/Two"
    })
  }

  build() {
    Column() {
      Column() {
        Text(`${this.message}`)
          .width("304vp")
          .height("60vp")
          .offset({ x: "-22.24vp", y: "-140.78vp" })
          .backgroundColor("#243784")
          .fontColor("#f1be04")
          .textAlign(TextAlign.Center)
          .fontSize("30fp")
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
        Divider()
          .width("92.1%")
          .height("3.33vp")
          .offset({ x: "-14.22vp", y: "-121.91vp" })
        Image($r('app.media.icon'))
          .width("73.16vp")
          .height("108.77vp")
          .offset({ x: "-42.69vp", y: "-74.99vp" })
        Toggle({ type: ToggleType.Button })
          .width("200vp")
          .height("60vp")
          .margin({ top: "0vp", bottom: "0vp", left: "0vp", right: "0vp" })
        TextInput()
          .width("200vp")
          .height("60vp")
        CheckboxGroup()
          .width("60vp")
          .height("60vp")
          .margin({ top: "12vp", bottom: "12vp", left: "12vp", right: "12vp" })
          .selectAll(false)
        Progress({ value: 0 })
          .width("67.05%")
          .height("4.78vp")
        Refresh({ friction: 62, offset: "16vp", refreshing: false })
          .width("100%")
          .height("100vp")
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
      .onClick(this.goTwo.bind(this))
    }    
    .width("100%")
    .height("100%")
  }
}