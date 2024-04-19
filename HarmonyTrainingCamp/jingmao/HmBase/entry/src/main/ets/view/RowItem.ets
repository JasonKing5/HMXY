@Component
export  default   struct RowItem {
  @State flag: boolean = false
  item:string = '劝君莫负艳阳天'
  build() {
    Row({ space: 30 }) {
      Image(this.flag ? $r('app.media.done') : $r('app.media.undo'))
        .width(40)
        .fillColor(Color.Gray)

      Text(this.item)
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

