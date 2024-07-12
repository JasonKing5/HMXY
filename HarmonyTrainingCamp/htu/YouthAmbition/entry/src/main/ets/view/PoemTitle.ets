import { router } from '@kit.ArkUI'

@Component
export default struct PoemTitle {
  // 当前的文字缩放倍数
  @Consume fontSizeScale: number

  @Consume isShowSettingPanel: boolean

  isShowSettingIcon: boolean = false
  imgSrc: Resource = $r('app.media.back')

  build() {
    Column() {
      Row() {
        Image(this.imgSrc)
          .height('50%')
          .onClick(() => {
            router.back()
          })
        Text() {
          Span('少').fontColor($r('app.color.appColor1'))
          Span('年').fontColor($r('app.color.appColor2'))
          Span('志').fontColor($r('app.color.appColor1'))
        }
        .fontSize((26 * this.fontSizeScale).toFixed(0))

        if (this.isShowSettingIcon) {
          Image($r('app.media.setting'))
            .height('50%')
            .onClick(() => {
              this.isShowSettingPanel = !this.isShowSettingPanel
            })
        }
      }
      .width('80%')
      .height(60)
      .justifyContent(FlexAlign.SpaceAround)

      Divider().strokeWidth(3).color($r('app.color.appColor1'))
    }
  }
}