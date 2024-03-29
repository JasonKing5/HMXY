import Constants from '../common/Constants'

@Entry
@Component
struct TodoList {
   message: string = 'todolist'

  build() {
    Column({space:20}) {
      Text(this.message).fontSize(25)
      Divider()

      Row({space:30}){
        Image($r("app.media.undo"))
          .fillColor(Color.Red)
          .width(30)
        Text('大合照')
      }
      .width('80%')
      .height(60)
      // .justifyContent(FlexAlign.Center)
      .borderRadius(30)
      .padding({
        left:30
      })
      .backgroundColor('#fff')

      Row({space:30}){
        Image($r("app.media.done"))
          .fillColor(Color.Red)
          .width(30)
        Text('learn Harmony')
      }
      .width('80%')
      .height(60)
      // .justifyContent(FlexAlign.Center)
      .borderRadius(30)
      .padding({
        left:30
      })
      .backgroundColor('#fff')


    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center) //主轴方位
    .backgroundColor(Constants.BGC)
  }
}