@Component
export default struct PoemTitle {
  isShowSetting:boolean = false
  imgSrc:Resource = $r('app.media.back')
  build() {
    Column(){
      Row() {

        Image(this.imgSrc)
          .height('50%')

        Text() {
          Span('少').fontColor($r('app.color.appColor1'))
          Span('年').fontColor($r('app.color.appColor2'))
          Span('志').fontColor($r('app.color.appColor1'))
        }
        .fontSize(26)

        if (this.isShowSetting){
          Image($r('app.media.setting'))
            .height('50%')
        }
      }
      .width('80%')
      .height(60)
      .justifyContent( FlexAlign.SpaceAround)

      Divider().strokeWidth(3).color($r('app.color.appColor1'))
    }
  }
}