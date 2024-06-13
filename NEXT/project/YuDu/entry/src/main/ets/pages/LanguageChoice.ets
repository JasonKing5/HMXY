import router from '@ohos.router'
import Constants from '../common/Constants'
import { Language } from '../model/Data'
import LanguageItem from '../view/LanguageItem'

@Entry
@Component
struct LanguageChoice {
  items: Language [] = Constants.languageItem

  build() {
    Column({ space: 30 }) {
      Text('语种选择：')
        .fontSize(30)
        .fontColor('#ffd73e3e')
        .fontWeight(700)

      List({space:20}) {
        ForEach(this.items,
          (item: Language, index: number) => {
            ListItem() {
              LanguageItem({item})
                .onClick(() => {
                  // TODO:将选择的那个语种，存起来。
                  // 4.0 API9
                  AppStorage.SetOrCreate('lang',item.lang)
                  // next api10+
                  // AppStorage.setOrCreate('lang',item.lang)
                  router.back()
                })
            }
          })

      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}

