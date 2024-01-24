@Component
export default struct TodoItem {
  @State isDone: boolean = false
  content ?: string
  build() {
    Row({ space: 20 }) {
      if (this.isDone) {
        Image($r('app.media.todo_ok')).TodoItem_img()
      } else {
        Image($r('app.media.todo_default')).TodoItem_img()
      }
      Text(this.content)
        .fontSize(20)
        .decoration({ type: this.isDone ? TextDecorationType.LineThrough : TextDecorationType.None })
        .opacity(this.isDone ? 0.5 : 1)
    }
    .TodoItem_row()
    .onClick(() => {
      this.isDone = !this.isDone
    })
  }
}

// 图片样式函数
@Extend(Image) function TodoItem_img() {
  .width(30)
  .height(30)
  .objectFit(ImageFit.Contain)
  .margin(20)
}
// 扩展row 样式函数
@Extend(Row) function TodoItem_row() {
  .width('90%')
  .height(50)
  .backgroundColor(Color.White)
  .borderRadius(25)
}