@Entry
@Component
struct StateComp {
  // 数据驱动视图更新
  @State num: number = 15
  @State str: string = '15'

  build() {
    Column({ space: 20 }) {
      Text(this.str).fontSize(30)
      Button('age++')
        .onClick(() => {
          this.num++
          // 扣500
          if (this.num % 7 == 0  || this.num.toString().includes('7') )  {
            this.str = '过'
          } else {
            this.str = this.num.toString()
          }
        })

    }
    .width('100%')
    .height('100%')
  }
}