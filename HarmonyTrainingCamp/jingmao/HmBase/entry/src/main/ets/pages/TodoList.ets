/*
 * todo: 待办列表，触类旁通。掌握布局知识。和arkts。
 * */
import todo from '../dataModel/TodoListData'
import RowItem from '../view/RowItem'

@Entry
@Component
struct TodoList {
  // listArr:Array<string> = []
  // 页面数据不是直接就给了。
  listArr:string[] = []
  // 再也没build之前再给数据 。生命周期函数。
  aboutToAppear() {
    // 很可能有网络请求
    this.listArr = todo.getData()
  }
  build() {
    Column({ space: 20 }) {
      Text('HarmonyOS4.0')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Divider()
      ForEach(
        this.listArr,
        (item: string, index: number) => {
          // rowItem({item:item})
          RowItem({item})
        }
      )
    }
    .clmStyle()
  }
}

// 封装最外层的布局容器的样式效果
@Extend(Column)
function clmStyle() {
  .width('100%')
  .height('100%')
  .backgroundColor($r('app.color.app_background'))
  .justifyContent(FlexAlign.Center)
}



