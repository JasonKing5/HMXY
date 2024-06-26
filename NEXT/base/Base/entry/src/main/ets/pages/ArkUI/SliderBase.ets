import { router } from '@kit.ArkUI'
import { RouterParm } from '../../model/MyRouterInfo'
import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct SliderBase {
  @State message: string = (router.getParams() as RouterParm)?.pageName || '页面标题'
  @State sliderVal1:number  = 40
  build() {
    Column({ space: 30 }) {
      TopTitle({message:this.message})
      // slider基本用法
      Text(`当前滑块的值${this.sliderVal1}`)
      Slider({
        min:0,
        max:100,
        value:40,
        step:10,
        // 滑块在外面 || 里面
        // style:SliderStyle.OutSet,
        style:SliderStyle.InSet,
        // 横向 或者  纵向
        direction:Axis.Horizontal,
        // direction:Axis.Vertical,
        // 是否反向滑动
        reverse:false
      })
        .width('90%')
        .showTips(true)   // 滑动时候展示百分比
        .blockColor('#ffe2109c')    // 滑块颜色
        // 改变滑块时 会获取当前滑块值  60%的时候好像有点异常 但是无伤大雅
        .onChange((value) => {
          this.sliderVal1 = value
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}