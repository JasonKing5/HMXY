// 动画：显示动画
@Entry
@Component
struct Animation1 {
  @State title: string = '显示动画'
  arrHA:Array<HorizontalAlign> = [HorizontalAlign.Start,HorizontalAlign.Center,HorizontalAlign.End]

  @State HoriAli: HorizontalAlign =this.arrHA[0]
  index:number = 0
  build() {
    Row() {
      Column({space:20}) {
        Text(this.title).fontSize(30)
        Column({space:20}) {
          Text('中飞院').fontSize(20).fontColor(Color.Red)
          Image($r('app.media.zfy'))
            .width('30%')
          Text('训练营')
        }
        .width('90%')
        .height(300)
        .backgroundColor('#ffff9999')
        .border({
          width: 2
        })
        .justifyContent(FlexAlign.Center)
        .alignItems(this.HoriAli)
        .onClick(() => {
          animateTo(
            {
              duration:1000,
              // delay:0,
              iterations:1,
              playMode:PlayMode.Alternate,
              // 动画曲线
              curve:Curve.Linear,
              // onFinish: () => {
              //   this.title = 'animation finish'
              // }
            },
            () => {
              this.HoriAli = this.arrHA[  ++this.index % this.arrHA.length  ]
            }
          )
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}