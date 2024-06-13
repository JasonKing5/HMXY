import ConstantsData from '../constants/ConstantsData'

@Component
export default struct ShowRecommend {
  recommendPoem: string [] = ConstantsData.recommendPoem

  build() {
    List({ space: 15 }) {
      ForEach(this.recommendPoem, (item: string, index: number) => {
        ListItem() {
          Column({ space: 10 }) {
            Text(item)
              .fontSize(18)
              .fontColor(index % 2 == 0 ? '#ffe06d6d' : '#ffe934f6')
            Divider()
              .width('80%')
          }
        }
        .width('100%')
        .height('50')
      })
    }
    .recomStyle()
  }
}

@Extend(List)
function recomStyle() {
  .width('90%')
  .height('96%')
  .backgroundColor('#fff1d7d7')
  .padding(5)
  .borderRadius(10)
  .alignListItem(ListItemAlign.Center)
}
