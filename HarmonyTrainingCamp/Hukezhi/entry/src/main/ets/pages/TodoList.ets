import router from '@ohos.router'
import Constants from '../common/Constants'
import Item from '../view/Item'

@Entry
@Component
struct TodoList {
  message: string = 'todolist'
  // lists:Array<string> = ['大合照','todolist','动画','天气预报']
  lists:string[] = ['大合照',"todolist",`动画`,'天气预报','todolist']
  build() {
    Column({ space: 20 }) {
      Text(this.message)
        .fontSize(25)
        .onClick(() => {
          router.back()
        })
      Divider()
      ForEach(
        this.lists,
        (item: string, index: number) => {
          Item({content:item})
        }
      )
    }
    .clnStyle()
  }
}


@Extend(Column)
function clnStyle() {
  .width('100%')
  .height('100%')
  .justifyContent(FlexAlign.Center) //主轴方位
  .backgroundColor(Constants.BGC)
}

