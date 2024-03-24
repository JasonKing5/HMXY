/*
 * todolist案例
 * */
import Constants from '../common/Constants'
import RowItem from '../view/RowItem'

@Entry
@Component
struct TodoList {

  // lists:string[] = []
  lists : Array<string> = []

  //生命周期函数 页面加载之前
  aboutToAppear(){
    //获取网络数据  ['皮蛋瘦肉粥',"大盘鸡",`烤生蚝`]
    this.lists = ['皮蛋瘦肉粥',"大盘鸡",`烤生蚝`]
  }

  build() {
    Column({ space: 30 }) {
      Text(Constants.TODOLISTTITLE)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .fontStyle(FontStyle.Italic)
      Divider()
      ForEach(this.lists, (item:string,index:number) => {
        RowItem({content:item})
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Constants.BGC)
    .justifyContent(FlexAlign.Center)
  }
}



