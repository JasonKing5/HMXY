import router from '@ohos.router'

@Component
export default  struct TopTitle {
  message:string  = '标题'
  build() {
    Row() {
      Image($r('app.media.back'))
        .width(50)
        .fillColor('#ff9c1be2')
        .onClick(() => {
          router.back()
        })
      Text(this.message)
        .fontSize(30)
      // .copyOption(CopyOptions.InApp)
    }
    .titleStyle()

  }
}

@Extend(Row)
function titleStyle() {
  .width('90%')
  .justifyContent(FlexAlign.SpaceBetween)
  .padding({
    left: 30,
    right: 30
  })
}
