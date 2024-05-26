// 收藏页面
import Constants from '../common/Constants'
import { PoemFromApi } from '../data/LightGreenData'
import ShowCollItem from '../view/ShowCollItem'
import Title from '../view/Title'
import { getColl } from '../viewModel/MyUtils'

@Entry
@Component
struct ShowColl {
  // 我想要的是收藏起来的数组，好多对象。
 @State  collPoems: PoemFromApi[] = getColl(Constants.baiShi) as PoemFromApi[]

  build() {
    Column({ space: 30 }) {
      Title({hasBack:true})
      Divider()
      if (this.collPoems.length === 0 ){
        Text('请快去收藏你喜欢的诗句吧')
          .fontSize(40)
          .fontColor('#ffde3e3e')
          .width(40)
      }
      List({space:20}) {
        ForEach(this.collPoems, (item:PoemFromApi,index:number) => {
          ListItem() {
            ShowCollItem({item})
          }
        })
      }
      .alignListItem(ListItemAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Start)
  }
}