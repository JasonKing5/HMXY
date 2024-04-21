// 学习诗文  布局效果
@Entry
@Component
struct PoemStudy {
  @State message: string = '诗文学习'

  build() {
    Row() {
      Column({space:20}) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        // 行布局  还不会背
        Row({space:10}) {
          //   图片
          Image($r('app.media.undo'))
            .width(40)
            .height(40)
            .fillColor(Color.Red)
          //   诗句
          Text('我到洛阳不吟诗，牡丹少年即文章')
            .fontSize(17)
            .opacity(1)
            .decoration({
              type:TextDecorationType.None
            })
        }
        .width('89%')
        .height(50)
        .backgroundColor(Color.Pink)
        .padding({
          left:10
        })
        .borderRadius(25)

        // 已经掌握
        Row({space:10}) {
          //   图片
          Image($r('app.media.done'))
            .width(40)
            .height(40)
            .interpolation(ImageInterpolation.High)//插值效果，图片放大保持高清，抗锯齿状
            .fillColor(Color.Green)
          //   诗句
          Text('垂杨紫陌洛城东，明年花胜去年红')
            .fontSize(17)
            .opacity(.5)
            .decoration({
              type:TextDecorationType.LineThrough
            })
        }
        .width('89%')
        .height(50)
        .backgroundColor(Color.Pink)
        .padding({
          left:10
        })
        .borderRadius(25)
      }
      .width('100%')
    }
    .height('100%')
  }
}