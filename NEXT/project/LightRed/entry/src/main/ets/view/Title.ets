import router from '@ohos.router'

@Component
export default struct Title{
  hasBack:boolean  = false
  build() {
    Row() {
      if (this.hasBack){
        Image($r('app.media.back'))
          .width(30)
          .fillColor('#ffec3939')
          .onClick(() => {
            router.back()
          })
      }

      Image($r('app.media.logo'))
        .width('60')
        // 测试图片是否可以拖拽
        .copyOption(CopyOptions.InApp)
        .draggable(true)
      Text($r('app.string.EntryAbility_label'))
        .fontSize(30)
        .fontColor('#ffa11bd4')

    }
    .titleStyle()
  }
}

@Extend(Row)
function titleStyle() {
  .width('90%')
  .height(80)
  .justifyContent(FlexAlign.SpaceEvenly)
}
