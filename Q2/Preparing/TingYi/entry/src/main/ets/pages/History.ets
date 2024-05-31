import router from '@ohos.router'
import { Constants } from '../common/Constants'
import { Record } from  '../model/Data'
import Title from '../view/Title'
import { getHistory, langToChinese } from '../viewModel/FunUtils'

@Entry
@Component
struct History {
  @State historyArr: Record [] = []

  aboutToAppear(){
    // 在build之前，准备需要渲染的【历史翻译】数据
    this.historyArr = getHistory()
  }
  build() {
    Column({space:20}) {
      Row({space:20}){
        Image($r('app.media.back'))
          .width(30)
       Title()
      }
      .margin({top:30})
      .onClick(() => {
        router.back()
      })


      Text('翻译记录').fontSize(20)

      List({space:10}) {
        ForEach(this.historyArr, (item:Record , index: number) => {
          ListItem() {
            Row() {
              Text(index + '').fontSize(20)
              Text( langToChinese(item.from) ).fontColor('#ff724444')
              Text(item.src).fontSize(20)
              Text(`<---${item.tranApi}-->`)
              Text(item.dst).fontSize(20)
              Text( langToChinese(item.to)).fontColor('#ff1e9fb0')
            }
            .justifyContent(FlexAlign.SpaceEvenly)
            .width('100%')
            .height(40)
            .borderRadius(10)
            .backgroundColor(item.tranApi === Constants.tianxing ? '#ffc88888' : '#ffaec644')
          }
        })
      }
      .alignListItem(ListItemAlign.Center)
      .padding(20)
      .layoutWeight(1)
      .backgroundColor('#ffbbe9cc')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe8eeee')
  }
}