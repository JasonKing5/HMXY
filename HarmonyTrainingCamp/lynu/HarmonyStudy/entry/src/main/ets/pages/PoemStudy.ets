// 学习诗文  布局效果
@Entry
@Component
struct PoemStudy {
  @State message: string = '诗文学习'
  @State flag: boolean = false

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        // 行布局  还不会背
        Row({ space: 10 }) {
          //   图片
          Image( this.flag? $r('app.media.done') : $r('app.media.undo')  )
            .width(40)
            .height(40)
            .fillColor( this.flag ? Color.Green : Color.Red)
          //   诗句
          Text('我到洛阳不吟诗，牡丹少年即文章')
            .fontSize(17)
            .opacity(this.flag ? .5 : 1)
            .decoration({
              type:  this.flag ? TextDecorationType.LineThrough : TextDecorationType.None
            })
        }
        .width('89%')
        .height(50)
        .backgroundColor(Color.Pink)
        .padding({
          left: 10
        })
        .borderRadius(25)
        .onClick(() => {
          //修改样式属性  比如换一张图，文字透明度，文字样式的贯穿
          this.flag = !this.flag
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}