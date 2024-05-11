// 用于主页的历史界面 UI封装
import router from '@ohos.router'
import Constants from '../common/Constants'
import { getDataTianXing, saveHistory } from '../fun/getData'
import { TianXingResp } from '../model/Data'

@Component
export default struct Translate {
  @State iptText: string = ''
  @State result: string = ''
  @Prop lang: string

  build() {
    Column({ space: 10 }) {
      //“语言选择” 提示文本
      Row() {
        Text('目标语种：' + Constants.languageMap[this.lang])
          .fontSize(20)
          .fontColor($r('app.color.main_text'))
        Image($r("app.media.more"))
          .width(15)
          .height(15)
      }
      .onClick(() => {
        router.pushUrl({
          url: "pages/LanguageChoice"
        })
      })

      //输入框,通过输入框接收键盘的输入值并赋值给 状态变量ipt
      TextInput({ text: this.iptText, placeholder: '请输入要翻译的文本' })
        .width("90%")
        .height(200)
        .onChange((value: string) => {
          this.iptText = value
        })
      // 点击翻译按钮，携带用户输入的数据 发送网络请求进行翻译
      Button("点击翻译")
        .width('30%')
        .backgroundColor('#ffe2afaf')
        .fontColor($r('app.color.main_text'))
        .onClick(async () => {
          //todo：翻译 功能
          let respObj: TianXingResp = await getDataTianXing(this.iptText, this.lang)
          this.result = respObj.dst
        //   todo:本地存储respObj 在翻译历史中获取
          saveHistory(respObj)
        })
      TextInput({ text: this.result, placeholder: '翻译结果' })
        .width("90%")
        .height(200)
        .onChange((value: string) => {
          this.result = value
        })

    }
    .width('100%')
    .height('80%')
  }
}