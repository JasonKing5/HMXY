import RouterCfg from '../common/routerConfig'
import { NavigationModel } from '../model/BaseClass'
import { router } from '@kit.ArkUI'

@Component
export default struct NavigationList{

  // 动态的导航数据源 数组 NavigationModel
  homeArr:NavigationModel [] = []
  build() {
    List({ space: 20 }) {
      // 跳转按钮。 List
      ForEach(this.homeArr, (item: NavigationModel, index: number) => {
        ListItem() {
          Row() {
            Text(index + '').fontSize(20).fontColor('#ff0362f5')
            Text(item.label).fontSize(20).fontColor('#ffc3351b')
          }
          .width('80%')
          .height(40)
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({ left: 20, right: 20 })
          .borderRadius(30)
          .backgroundColor('#ff79b3ef')
          .onClick(() => {
            router.pushUrl({
              url: item.url,
              params: {
                title: item.title
              }
            })
          })
        }
      })
    }
    .width('100%')
    .alignListItem(ListItemAlign.Center)
    .layoutWeight(1)
  }
}