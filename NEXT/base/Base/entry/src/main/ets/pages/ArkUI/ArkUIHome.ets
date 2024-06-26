// arkui 目录
import { router } from '@kit.ArkUI'
import Constants from '../../common/Constants'
import { RouterParm } from '../../model/MyRouterInfo'
import RouterList from '../../view/RouterList'
import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct ArkUIHome {
  @State message: string = (router.getParams() as RouterParm)?.pageName || '页面标题'

  build() {
    Column({ space: 10 }) {
      TopTitle({message:this.message})
      //arkui导航列表
      RouterList({currentRouters:Constants.arkUIRouters})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    // .justifyContent(FlexAlign.Center)
  }
}