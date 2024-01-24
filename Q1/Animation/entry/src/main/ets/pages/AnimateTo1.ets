// 显示动画：位置属性发生改变
@Entry
@Component
struct AnimateTo1 {
  // 用于控制Column的alignItems属性
  @State itemAlign: HorizontalAlign = HorizontalAlign.Start;
  allAlign: HorizontalAlign[] = [HorizontalAlign.Start, HorizontalAlign.Center, HorizontalAlign.End];
  index:number = 0

  @State title:string = '点击修改布局位置'

  build() {
    Column({space:30}) {
      Text(this.title)
        .fontSize(30)
        .margin({top:100})
      Column({ space: 10 }) {
        Button("帝心").width(100).height(50)
        Button("庄生").width(100).height(50)
        Button("周道").width(100).height(50)
      }
      .margin(20)
      .borderWidth(2)
      .width("90%")
      .height(400)
      .justifyContent(FlexAlign.Center)
      .alignItems(this.itemAlign)

      Button("click")
        .onClick(() => {
          animateTo({
            duration: 1000,
            curve:Curve.Linear,
            // delay:2000,
            // iterations : -1,// 无限动画循环。就不会触发喽。
            playMode:PlayMode.Alternate,
            onFinish: () => {
              this.title = '动画结束。并不难哦。'
            }
          }, () => {
            // 让索引值变化  1 2
            // this.index ++
            // if (this.index >= 3) {
            //   this.index = 0
            // }
            // 自行梳理。
            this.index = (this.index + 1) % this.allAlign.length;
            // 修改位置属性值
            this.itemAlign = this.allAlign[this.index]
          })
        })
        .fontSize(30)
    }
    .width("100%")
    .height("100%")
  }
}