// 导航按钮列表效果
import Contants from '../common/Constants'
import MyRouterInfo from '../model/MyRouterInfo'
import RouterItem from './RouterItem'


@Component
export default struct RouterList{
  currentRouters:Array<MyRouterInfo> = []
  build() {
    List({ space: 15 }) {
      ForEach(
        this.currentRouters,
        (router:MyRouterInfo, index) => {
          ListItem() {
            RouterItem({ r: router, i: index + 1 })
          }
        }
      )
    }
    .layoutWeight(1)
    .alignListItem(ListItemAlign.Center)
    .width('100%')
    .alignRules({
      top: { anchor: 'title', align: VerticalAlign.Bottom },
      middle: { anchor: 'title', align: HorizontalAlign.Center }
    })

  }
}