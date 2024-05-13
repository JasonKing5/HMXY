// 入口页，即翻译主页。
import Constants from '../common/Constants';
import { getHistory } from '../fun/getData';
import { TianXingResp } from '../model/Data';
import History from '../view/History';
import Translate from '../view/Translate';

@Entry
@Component
struct Index {
  @State historyArr: TianXingResp [] = getHistory()
  @State lang: string = Constants.lang
  @State currentIndex: number = 0

  // 一加载就需要获取当前所要翻译的目标语种: 页面返回,没有UI更新。不触发  aboutToAppear()
  onPageShow() {
    // this.lang = AppStorage.Get('lang') || Constants.lang
    this.lang = AppStorage.get('lang') || Constants.lang
  }

  build() {
    Column({ space: 30 }) {
      // 顶部标题
      Text($r('app.string.EntryAbility_label'))
        .fontSize(35)
        .fontWeight(FontWeight.Bold)
      //   翻译和历史tabs
      Tabs() {
        TabContent() {
          Translate({ lang: this.lang })
        }.tabBar($r('app.string.tab1'))

        TabContent() {
          History({index:this.currentIndex})
        }.tabBar($r('app.string.tab2'))
      }
      .backgroundColor('#eee')
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}