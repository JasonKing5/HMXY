@Component
export default struct PoemTitle {
  build() {
    Column(){
      Row() {
        Image($r('app.media.logo'))
          .height('50%')
        Text() {
          Span('少').fontColor($r('app.color.appColor1'))
          Span('年').fontColor($r('app.color.appColor2'))
          Span('志').fontColor($r('app.color.appColor1'))
        }
        .fontSize(26)

        Image($r('app.media.setting'))
          .height('50%')
      }
      .width('80%')
      .height(60)
      .justifyContent(FlexAlign.SpaceBetween)

      Divider().strokeWidth(3).color($r('app.color.appColor1'))
    }
  }
}