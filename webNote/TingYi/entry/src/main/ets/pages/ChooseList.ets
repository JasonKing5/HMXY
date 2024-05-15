import router from '@ohos.router'
import { Constants } from '../common/Constants'
import { LanguageMap } from '../model/Data'

@Entry
@Component
struct ChooseList {

  langaugeList:LanguageMap [] = Constants.langaugeList

  build() {
    Column({ space: 30 }) {
      Text('点击选择目标语种').fontSize(20).fontColor('#ffd02f2f')

      List({space:30}){
        ForEach(this.langaugeList,
          (item:LanguageMap,index:number) => {
            ListItem(){
              Row(){
                Text(item.lang).fontSize(26).fontColor('#ff117fea')
                Text(item.chinese).fontSize(26)
              }
              .width('80%')
              .height('50')
              .justifyContent(FlexAlign.Center)
              .borderRadius(25)
              .backgroundColor('#eee')
              .onClick(() => {
                // 全局的对象存储
                AppStorage.SetOrCreate('lang',item.lang)
                router.back()
              })
            }
          })


      }
      .alignListItem(ListItemAlign.Center)

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}