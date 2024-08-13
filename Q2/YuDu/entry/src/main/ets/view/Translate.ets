import router from '@ohos.router'
import { getDataTianXing, getLangaugeText, saveHistory } from '../fun/getData'
import axios, { AxiosResponse } from '@ohos/axios'
import { Resp } from '../model/Data'

@Component
export default struct Translate {
  @State ipt: string = 'Innovation Competition'
  @State dst: string = '创新赛'
  // 用户选择的语种。就是lang
  @Prop lang: string

  build() {
    Column({ space: 10 }) {
      Row({ space: 30 }) {
        // 你给我的是 zh spa 。。。 我想要对应的 中文 西班牙语
        Text('目标语种: ' + getLangaugeText(this.lang))
          .fontSize(20)
          .fontColor('#069955')
        Image($r('app.media.more'))
          .width(25)
          .height(25)
          .fillColor('#ffe91919')
      }
      .onClick(() => {
        router.pushUrl({
          url: "pages/LanguageChoice"
        })
      })

      TextInput({ text: this.ipt, placeholder: '请输入待翻译的文本' }).textIptStyle()
        .onChange((value: string) => {
          this.ipt = value

        })
        .onClick(() => {
          this.ipt = ''
          this.dst = ''
        })

      Row() {
        Button('语渡一下')
          .width('80%')
          .type(ButtonType.Normal)
          .backgroundColor('#ffe29090')
          .borderRadius(20)
          .onClick(async () => {
            let objResp: Resp = await getDataTianXing(this.ipt, this.lang)
            this.dst = objResp.dst
            // 保存起来这个 objResp 方便历史tab去展示。
            saveHistory(objResp)
          })

      }.btnRowStyle()

      TextInput({ text: this.dst, placeholder: '翻译结果' }).textIptStyle()
    }
    .width('100%')
    .height('80%')
  }
}

@Extend(Row)
function btnRowStyle() {
  .width('85%')
  .padding(20)
  .justifyContent(FlexAlign.SpaceAround)
}

@Extend(TextInput)
function textIptStyle() {
 .fontSize(20)
  .fontColor('#ffe05757')
  .placeholderColor('#ffa96f6f')
  .width('90%')
  .height(200)
  .backgroundColor('#fff0f8ea')
}
