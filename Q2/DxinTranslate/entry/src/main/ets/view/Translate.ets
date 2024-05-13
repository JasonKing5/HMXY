import router from '@ohos.router'
import { getLangaugeText } from '../fun/getData'


@Component
export default struct Translate {

  @Prop lang:string

  build() {
    Column({space:10}) {
      Row({ space: 30 }) {
        // 你给我的是 zh spa 。。。 我想要对应的 中文 西班牙语
        Text('目标语种: '  + getLangaugeText(this.lang)  )
          .fontSize(20)
          .fontColor('#069955')
        Image($r('app.media.more'))
          .width(25)
          .height(25)
          .fillColor('#ffe91919')

      }
      .onClick(() => {
        router.pushUrl({
          url:"pages/LanguageChoice"
        })
      })

      TextInput({placeholder:'请输入待翻译的文本'})
        .width('90%')
        .height(200)
      Row(){
        Button('天行翻译')
  
        Button('百度翻译')
      }
      // .backgroundColor('red')
      .width('85%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceAround)

      TextInput({placeholder:'翻译结果'})
        .width('90%')
        .height(200)


    }
    .width('100%')
    .height('80%')
  }
}