// 帝心推荐 布局内容
import Constants from '../common/Constants'
import { PoemFromApi } from '../data/LightGreenData'
import { cancelColl, saveCurrentPoem } from '../viewModel/MyUtils'

// @Preview
@Component
export default struct Recomment {
  pArr: Array<string> = Constants.dXinRecommend
  build() {
    List({space:20}) {
      ForEach(this.pArr, (item: string, index: number) => {
        ListItem() {
          // es6的对象简写形式
          ItemRow({item,index})
        }
        .dxinListStyle()
      })
    }
    // .backgroundColor('red')
    .alignListItem(ListItemAlign.Center)
    .padding({
      top:30
    })
  }
}

@Extend(ListItem)
function dxinListStyle() {
  .width('90%')
  .height(40)
}


@Component
 struct ItemRow{
  item:string = '日拱一卒无有尽，功不唐捐终入海'
  index:number = 0
  // 控制 每一行 ListItem 的颜色
  // @State itemColor:string = '#ffde5353'
  @State isColl:boolean = false
  build() {
    Row() {
      Text(this.item)
        .fontSize(20)
        .fontColor(this.index % 2 === 0 ? '#ff12aca7' : '#ff910fc1')
    }
    .rowStyle(this.isColl? '#ffe58686' : '#eee')
    .onClick(() => {
      this.isColl = !this.isColl
      //判断是否收藏
      if (this.isColl) {
        saveCurrentPoem(new PoemFromApi(this.item,'你猜','帝心推荐','帝心-喜欢'))
      }else {
        // 给我当前这句诗词。从数组中移除即可
        cancelColl(this.item)
      }
    })
  }
}

@Extend(Row)
function rowStyle(itemColor:string) {
  .width('100%')
  .height('100%')
  .borderRadius(20)
  .justifyContent(FlexAlign.Center)
  .backgroundColor(itemColor)
}
