@Component
export default struct RowItem{
  content:string = '早餐'
  @State flag:boolean = false
  build(){
    Row({space:20}) {
      Image( this.flag ? $rawfile('done.svg') : $rawfile('undo.svg'))
        .width(30)
        .fillColor(Color.Red)
      Text(this.content)
        .decoration({type: this.flag  ? TextDecorationType.LineThrough : TextDecorationType.None})
        .opacity(this.flag ? .3 : 1)
    }
    .RowStyle()
    .onClick(() => {
      this.flag = !this.flag
    })
  }
}




@Extend(Row)
function RowStyle() {
  .width('80%')
  .height(50)
  .backgroundColor(Color.White)
  // .borderRadius(40)
  // .borderWidth(3)
  // .borderStyle(BorderStyle.Solid)
  // .borderColor(Color.Green)
  .border({
    width:2,
    style:BorderStyle.Solid,
    radius:40,
    color:Color.Green
  })
  .padding({
    left:20
  })
}
