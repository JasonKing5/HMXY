import { getHistory } from '../fun/getData'
import { Resp } from '../model/Data'

@Component
export default struct History {
  @State historyArr: Resp[] = []
  // index是父组件index给我的。0 1 如果变化。就获取历史翻译
  @Prop @Watch('changIndex') index: number

  // 监听index变化的函数 在其中处理某些业务
  changIndex() {
    if (this.index === 1) {
      this.historyArr = getHistory()
      console.log('历史数据中的：',JSON.stringify(this.historyArr))
    }
  }

  //当某一刻的时候，此时再去获取历史数据。
  build() {
    Column() {
      Text('翻译记录').fontSize(20)

      List({space:10}) {
        ForEach(this.historyArr, (item: Resp, index: number) => {
          ListItem() {
            Row() {
              Text(index + '')
              Text(item.from)
              Text(item.src)
              Text('-----')
              Text(item.dst)
              Text(item.to)
            }
            .justifyContent(FlexAlign.SpaceEvenly)
            .width('90%')
            .height(30)
          }
        })
      }
      .layoutWeight(1)
      .backgroundColor('#ffbbe9cc')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe8eeee')
  }
}