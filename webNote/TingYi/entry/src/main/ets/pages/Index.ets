import axios, { AxiosResponse } from '@ohos/axios'
import router from '@ohos.router'
import { Constants } from '../common/Constants'
import { getDataTianXing, langToChinese } from '../viewModel/FunUtils'

@Entry
@Component
struct Index {
  @State message: string = ''
  @State dst: string = ''
  @State lang: string = '' // 用来记录被选择的语种

  // 不要用  aboutToAppear()  有区别
  onPageShow() {
    this.lang = AppStorage.Get('lang') || 'zh'
  }

  build() {
    Column({ space: 30 }) {
      Text($r('app.string.EntryAbility_label'))
        .fontSize(30)
        .fontColor('#ffde07ac')

      Text('目标语种选择：' + langToChinese(this.lang))
        .fontSize(22)
        .fontColor('#ffdd3232')
        .onClick(() => {
          router.pushUrl({
            url: "pages/ChooseList"
          })
        })

      TextInput({ placeholder: '请输入内容我给你翻译' })
        .backgroundColor('#eee')
        .width('80%')
        .height(200)
        .placeholderColor('#ff0d17cb')
        .onChange((val: string) => {
          this.message = val
        })

      Button('点击翻译')
        .onClick(async () => {
          let res = await getDataTianXing(this.message, this.lang)
          this.dst = res
        })

      TextInput({ text: this.dst, placeholder: '翻译结果' })
        .backgroundColor('#eee')
        .width('80%')
        .height(200)
        .placeholderColor('#ff0d17cb')
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}