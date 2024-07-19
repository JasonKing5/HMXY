import PoemTitle from '../view/PoemTitle'
import SettingPanel from '../viewModel/mainPoem/SettingPanel'
import MySwiper from '../viewModel/mainPoem/MySwiper'
import PoemArea from '../viewModel/mainPoem/PoemArea'
import Constants from '../common/Constants'

let currentPoemState = LocalStorage.getShared()

@Entry(currentPoemState)
@Component
struct MainPoem {
  @LocalStorageLink(Constants.isCollectCurrentPoem) isCollect :boolean = false

  @Provide isShowSettingPanel : boolean = false

  @Provide fontSizeScale :number = 1

  build() {
    Stack(){
      Column() {
        // 1 顶部标题栏
        PoemTitle({isShowSettingIcon:true,imgSrc:$r('app.media.logo')})
        // 2  轮播区域
        MySwiper()
        // 3 展示诗词主体区域
        PoemArea()
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.theme_color'))
      // 4 个性化配置首选项区域
      if (this.isShowSettingPanel){
        SettingPanel()
          .offset({
            y:240
          })
      }
    }
  }
}



