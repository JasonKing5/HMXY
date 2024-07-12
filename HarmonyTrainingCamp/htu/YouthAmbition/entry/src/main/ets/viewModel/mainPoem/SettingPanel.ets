@Component
export default struct SettingPanel {
  @Consume fontSizeScale: number

  build() {
    Column() {
      Text('字体缩放' + this.fontSizeScale.toFixed(1))
      Row(){
        Text('A').fontSize(14)
        Slider({
          step: 0.1,
          min: 0.8,
          max: 1.2,
          value: this.fontSizeScale
        })
          .margin(10)
          .trackColor($r('app.color.appColor1'))
          .selectedColor($r('app.color.appColor2'))
          .onChange((val: number) => {
            this.fontSizeScale = val
          })
          .width('80%')
        Text('A').fontSize(20)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('95%')
    .height(200)
    .borderRadius(20)
    .backgroundColor('#fff')
    .justifyContent(FlexAlign.Center)
  }
}