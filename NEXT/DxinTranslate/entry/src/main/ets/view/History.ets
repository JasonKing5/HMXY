// 用于主页的翻译界面UI封装
import { getHistory } from '../fun/getData'
import { TianXingResp } from '../model/Data'

// 在翻页tab中已经保存成功了历史记录。在当前历史tab如何获取到呢。
// 遇到的问题：index.ets加载时，两个tab页均执行了自己的代码。此时历史tab中无历史数据。
// 即便左侧翻译tab中操作了业务，保存了。但是历史tab是一早就执行的代码

@Component
export default struct History {
  @Prop @Watch('changeIndex') index: number
  @State historyArr: TianXingResp[] = []

  // 监听index
  changeIndex() {
    if (this.index == 1) {
      this.historyArr = getHistory()
      // console.log('历史中的：',JSON.stringify(historyArr))
    }
  }

  build() {
    Column({ space: 30 }) {
      Text('翻译记录')
      List({space:30}) {
        ForEach(this.historyArr,
          (item: TianXingResp, index: number) => {
            ListItem() {
             Row({space:10}){
               Text(index+'')
               Text(item.src)
               Text(item.dst)
             }
             .justifyContent(FlexAlign.SpaceEvenly)
              .width('90%')
              .height('30')
            }
          })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}