import router from '@ohos.router'
import Constants from '../common/Constants'
import { Language } from '../model/Data'
import LanguageItem from '../view/LanguageItem'

@Entry
@Component
struct LanguageChoice {
   items: Language[] = Constants.languageItem
  build() {
    Column({ space: 10 }) {
      Row() {
        Text("目标语种选择")
          .fontSize(30)
          .fontColor($r('app.color.main_text'))
          .fontWeight(FontWeight.Bold)
      }

      Column({ space: 10 }) {
        List({ space: 10 }) {
          ForEach(
            this.items,
            (item: Language) => {
              ListItem() {
                LanguageItem({item})
                .onClick(() => {
                  //通过点击事件，保存当前所选语种。即 item.lang。供翻译页使用
                  // API9
                  AppStorage.SetOrCreate('lang',item.lang)
                  // API10+
                  // AppStorage.setOrCreate('lang',item.lang)
                  //点击返回
                  router.back()
                })
              }
            }
          )
        }.layoutWeight(1)
      }.layoutWeight(1)
    }.backgroundColor("#F1F2F3").height("100%")
  }
}

