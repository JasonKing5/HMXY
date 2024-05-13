import Constants from '../common/Constants'
import History from '../view/History'
import Translate  from '../view/Translate'

@Entry
@Component
struct Index {

  // 为什么要传递英文表示 http请求翻译
  @State lang:string = Constants.lang

  // index页面 重新展示的时候，修改 lang
  onPageShow(){
    // API9
    this.lang = AppStorage.Get('lang') || Constants.lang
    // NEXT 版本
    // this.lang = AppStorage.get('lang') || Constants.lang
  }
  build() {
    Column({ space: 30 }) {
      Text($r('app.string.EntryAbility_label'))
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.main_text'))

      Tabs(){
        TabContent(){
          Translate({lang:this.lang})
        }.tabBar($r('app.string.tab1'))

        TabContent(){
          History()
        }.tabBar($r('app.string.tab2'))
      }
      .backgroundColor('#eee')

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}

