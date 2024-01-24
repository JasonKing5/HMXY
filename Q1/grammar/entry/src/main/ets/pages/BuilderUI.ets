/*
 * 自定义组件构建函数
 * */
@Entry
@Component
struct BuilderUI {
  @State message: string = '@Builder'
  @State isDone: boolean = false

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        item('劝君莫惜金缕衣')
        item('劝君莫惜金缕衣')
      }
      .width('100%')
    }
    .height('100%')
  }
}

// 写在外面的自定义组件构建函数  方便多组件共同调用
@Builder  function  item(content:string){
  Row() {
    Image(this.isDone ? $r('app.media.todo_ok') : $r('app.media.todo_default'))
      .width(20)
      .height(20)
      .margin(15)
    Text(content)
      .decoration({ type: this.isDone ? TextDecorationType.LineThrough : TextDecorationType.None })
  }
  .backgroundColor(Color.Pink)
  .borderRadius(25)
  .margin({
    top: 15
  })
  .onClick(() => {
    this.isDone = !this.isDone
  })
}





