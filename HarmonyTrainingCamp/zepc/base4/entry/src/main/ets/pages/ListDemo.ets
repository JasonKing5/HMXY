@Entry
@Component
struct ListDemo {
  // 声明一个数组
  arr:string[] = ['1','2','3','4','5']
  build() {
    Column({ space: 30 }) {
      List({ space: 30 }) {
        // list里面记住 只能写list的儿子。
        ForEach(this.arr, (item:string,index:number) => {
          ListItem() {
            // listItem里面只能写一个儿子
            Row({space:40}){
              Text(index.toString())
                .fontSize(50)
              Button(item, { type: ButtonType.Normal })
                .width('30%')
                .height(200)
                .borderRadius(30)
            }
          }
        })
      }
      .backgroundColor('#ffd613dd')
      .width('98%')
      .height('100%')
      .alignListItem(ListItemAlign.Center)

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}


// Button('22',{type:ButtonType.Normal})
//   .width('90%')
//   .height(200)
//   .borderRadius(30)
// Button('33',{type:ButtonType.Normal})
//   .width('90%')
//   .height(200)
//   .borderRadius(30)
// Button('44',{type:ButtonType.Normal})
//   .width('90%')
//   .height(200)
//   .borderRadius(30)
// Button('55',{type:ButtonType.Normal})
//   .width('90%')
//   .height(200)
//   .borderRadius(30)