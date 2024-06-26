// 设置字体大小修改的面板效果 枚举
import Constants from '../common/Constants'
import PreferencesUtil from '../common/PreferencesUtil'


@Component
export default struct IndexFontSizePanel {
  // 从首页传递过来的字体尺寸
  @Consume fontSize: number

  // 根据字体大小显示的文本标记 数据枚举
  fontSizeLabel: Record<number,string>  = {
    14:'小',
    16:'标准',
    18:'大',
    20:'特大'
  }

  build() {
    Column() {
      Text(this.fontSizeLabel[this.fontSize]).fontSize(20)
      Row() {
        Text('A')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
        Slider({
          min: 14,
          max: 20,
          step: 2,
          value:this.fontSize
        })
          .onChange((val:number) => {
            this.fontSize = val
            // 将设置的数据持久化到首选项
            PreferencesUtil.putPreferenceVal(Constants.prefFontSizeObj.name,Constants.prefFontSizeObj.key,val)
          })
          .width('80%')
          .showSteps(true)
          .trackThickness(6)

        Text('A')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }

    }
    .width('90%')
    .padding(15)
    .backgroundColor('#ffccd6e0')
    .borderRadius(20)
    .alignRules({
      bottom:{anchor:'__container__',align:VerticalAlign.Bottom},
      middle:{anchor:'__container__',align:HorizontalAlign.Center}

    })
  }
}