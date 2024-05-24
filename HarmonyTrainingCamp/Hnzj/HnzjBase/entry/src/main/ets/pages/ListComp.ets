// 常用布局组件不能滑动。
import router from '@ohos.router'

@Entry
@Component
struct ListComp {
  @State message: string =router.getParams()?.['title'] || 'List'

  build() {
    Column({ space: 30 }) {
      Text(this.message).fontSize(30)
      Divider()
      List({space:20}){
        // 暂时伪代码，明天forEach
        ListItem(){
          Row({ space: 20 }) {
            Text("河职第一帅哥陈自豪")
            Text('河职第一美女王红霞')
          }
          .rowInListStyle()
        }
        ListItem(){
          Row({ space: 20 }) {
            Text("河职第一帅哥陈自豪")
            Text('河职第一美女王红霞')
          }
          .rowInListStyle()
        }
        ListItem(){
          Row({ space: 20 }) {
            Text("河职第一帅哥陈自豪")
            Text('河职第一美女王红霞')
          }
          .rowInListStyle()
        }

        ListItem(){
          Row({ space: 20 }) {
            Text("河职第一帅哥陈自豪")
            Text('河职第一美女王红霞')
          }
          .rowInListStyle()
        }
        ListItem(){
          Row({ space: 20 }) {
            Text("河职第一帅哥陈自豪")
            Text('河职第一美女王红霞')
          }
          .rowInListStyle()
        }
      }
      .alignListItem(ListItemAlign.Center)


    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}

@Extend(Row)
function rowInListStyle() {
  .width('80%')
  .height('30%')
  .backgroundColor('green')
  .justifyContent(FlexAlign.Center)
}
