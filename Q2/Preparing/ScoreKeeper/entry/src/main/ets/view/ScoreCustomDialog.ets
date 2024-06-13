@CustomDialog
export default struct ScoreCustomDialog {
  @Link left: {
    color: string,
    score: number,
    winGame: number,
    history: number[]
  }
  @Link right: {
    color: string,
    score: number,
    winGame: number,
    history: number[]
  }
  controller: CustomDialogController
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      Text('每局比分').fontSize(20).margin({ top: 10, bottom: 20 })
      Scroll(this.scroller) {
        Row() {
          ForEach(this.left.history, (item: number, index: number) => {
            Column() {
              Text(`第${index + 1}局`)
              Text(item.toString())
                .width(40)
                .textAlign(TextAlign.Center)
                .backgroundColor(this.left.color)
                .borderRadius(5)
                .margin({ top: 10 })
              Text(this.right.history[index].toString())
                .width(40)
                .textAlign(TextAlign.Center)
                .backgroundColor(this.right.color)
                .borderRadius(5)
                .margin({ top: 10 })
            }.margin({ right: 10 })
          })
          Column() {
            Text(`第${this.left.history.length + 1}局`)
            Text(this.left.score.toString())
              .width(40)
              .textAlign(TextAlign.Center)
              .backgroundColor(this.left.color)
              .borderRadius(5)
              .margin({ top: 10 })
            Text(this.right.score.toString())
              .width(40)
              .textAlign(TextAlign.Center)
              .backgroundColor(this.right.color)
              .borderRadius(5)
              .margin({ top: 10 })
          }.margin({ right: 10 })
        }
      }
      .width('90%')
      .scrollable(ScrollDirection.Horizontal)

      Button('确定')
        .onClick(() => {
          this.controller.close()
        })
        .backgroundColor('#ffffff')
        .fontColor(Color.Red)
    }
  }
}