import { PoemFromApi } from '../data/LightGreenData'
import { cancelColl, stringToArr } from '../viewModel/MyUtils'

@Component
export default struct ShowCollItem{
  item:PoemFromApi
  build() {
    Column({space:10}){
      Text(this.item.content).fontSize(20)

      Row(){
        Text(this.item.author)
          .textStyle('30%')
        Text(`《${this.item.origin}》`)
          .textStyle('50%')
        Text(stringToArr(this.item.category,'-')[1]).fontSize(16)
          .textStyle('20%')
      }
      .padding({
        left:20
      })
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Button('删除')
        .width(100)
        .fontSize(16)
        .type(ButtonType.Normal)
        .borderRadius(10)
        .backgroundColor('#ffb8abab')
        .fontColor('#ffd01313')
        .onClick(() => {
          cancelColl(this.item.content)
        })
    }
    .width('90%')
    .backgroundColor('#abc')
    .padding({
      top:10,
      bottom:10
    })
    .borderRadius(30)
  }
}

@Extend(Text)
function textStyle(widthVal:string) {
  .fontSize(20)
  .width(widthVal)
  .maxLines(1)
  .textOverflow({ overflow: TextOverflow.Ellipsis })
}
