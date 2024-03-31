@Component
export default struct Item {
  content: string = 'HarmonyOS'

 @State flag: boolean = false

  build() {
    Row({ space: 30 }) {
      Image( this.flag ?  $r("app.media.done") : $r("app.media.undo"))
        .fillColor(Color.Red)
        .width(30)
        .onClick(() => {
          this.flag = !this.flag
        })
      Text(this.content)
        .decoration({
          type:this.flag ? TextDecorationType.LineThrough : TextDecorationType.None
        })
        .opacity(  this.flag ? 0.5 : 1)
    }.rowStyle()
  }
}

// 扩展的样式函数：封装指定组件的属性方法
@Extend(Row)
function rowStyle() {
  .width('80%')
  .height(60)
  .borderRadius(30)
  .padding({
    left: 30
  })
  .backgroundColor('#fff')
}