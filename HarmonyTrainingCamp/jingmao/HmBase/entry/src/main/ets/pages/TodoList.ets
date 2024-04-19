/*
 * todo: 待办列表，触类旁通。掌握布局知识。和arkts。
 * */

@Entry
@Component
struct TodoList {
  @State flag: boolean = false
  // listArr:Array<string> = []
  listArr:string[] = ['收徒','勤能补拙','还活着','jacklove','uzi','faker']
  build() {
    Column({ space: 20 }) {
      Text('HarmonyOS4.0')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Divider()
      ForEach(
        this.listArr,
        (item: string, index: number) => {
          Row({ space: 30 }) {
            Image(this.flag ? $r('app.media.done') : $r('app.media.undo'))
              .width(40)
              .fillColor(Color.Gray)

            Text(item)
              .fontSize(25)
              .fontColor(Color.Blue)
              .decoration({
                type: this.flag ? TextDecorationType.LineThrough : TextDecorationType.None,
                color: Color.Red
              })
              .opacity(this.flag ? .5 : 1)
          }
          .rowStyle()
          .onClick(() => {
            this.flag = !this.flag
          })
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
  .backgroundColor('#ffe8eeee')
  .justifyContent(FlexAlign.Center)
}

// 这个函数是用来封装样式代码
@Extend(Row)
function rowStyle(){
  .width('80%')
  .height(60)
  .backgroundColor('#ffc4cee3')
  .padding({
    left: 40
  })
  .borderRadius(30)
}


