import router from '@ohos.router'
import { getDataBaiDu, getDataTianXing, saveHistory } from '../viewModel/FunUtils'
import { LanguageMap, Record } from '../model/Data'
import Title from '../view/Title'

@Entry
@Component
struct Index {
  @State message: string = ''
  @State dst: string = ''
  @State language: LanguageMap = new LanguageMap('zh', '中文') // 用来记录被选择的语种

  onPageShow() {
    this.language = AppStorage.Get('lang') || new LanguageMap('zh', '中文')
  }

  build() {
    Column({ space: 30 }) {
      Title()

      Text('目标语种选择：' + this.language.chinese)
        .fontSize(22)
        .fontColor('#ffdd3232')
        .onClick(() => {
          router.pushUrl({
            url: "pages/ChooseList"
          })
        })

      TextInput({ placeholder: '请输入内容我给你翻译' })
        .tiptStyle()
        .onChange((val: string) => {
          this.message = val;
        })

      Button('天行翻译')
        .btnStyle()
        .onClick(async () => {
          let objResp: Record = await getDataTianXing(this.message, this.language.lang);
          this.dst = objResp.dst;
          // 保存起来这个 objResp 方便历史tab去展示。
          saveHistory(objResp);
        })

      Button('百度翻译')
        .btnStyle()
        .onClick(() => {
          getDataBaiDu(this.message,this.language.lang)
        })

      TextInput({ text: this.dst, placeholder: '翻译结果' })
        .tiptStyle()

      Row({ space: 30 }) {
        Text('翻译记录').fontSize(20).fontColor('#ff127679')
        Image($r('app.media.history'))
          .width('30')
          .fillColor('#ffa92a2a')
      }
      .onClick(() => {
        router.pushUrl({
          url: "pages/History"
        })
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}

@Extend(Button)
function btnStyle() {
  .width('40%')
  .fontSize(20)
  .fontColor('#ff19ee25')
  .backgroundColor('#ff22724b')
}

@Extend(TextInput)
function tiptStyle() {
  .backgroundColor('#eee')
  .height(100)
  .width('80%')
  .placeholderColor('#ff676de0')
}
