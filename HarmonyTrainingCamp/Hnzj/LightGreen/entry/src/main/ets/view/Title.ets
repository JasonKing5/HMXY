@Component
export default struct Title{
  build() {
    Row() {
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
