import TopTitle from '../../view/TopTitle'
import { router } from '@kit.ArkUI'
import NavigationList from '../../view/NavigationList'
import RouterCfg from '../../common/routerConfig'

@Entry
@Component
struct ArkUIHome {
  title:string = (router.getParams() as Record<string,string>)?.title as string
  build() {
    Column({space:20}){
      TopTitle({title: this.title})
      // 导航列表
      NavigationList({homeArr:RouterCfg.arkUIHome})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}