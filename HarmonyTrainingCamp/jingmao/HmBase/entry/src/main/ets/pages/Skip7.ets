@Entry
@Component
struct Skip7 {
  @State count: number = 6

  build() {
    Row() {
      Column() {
        // 逢七过：位数为7 十位数为7 7的倍数 数学算法
        // 取模的结果没问题。不涉及小数
        // if (this.count % 10 == 7 || parseInt((this.count/10).toString()) == 7 || this.count% 7 == 0){
        //   Text('过')
        //     .fontSize(50)
        //     .fontWeight(FontWeight.Bold)
        //     .fontColor('red')
        // }else{
        //   Text(this.count.toString())
        //     .fontSize(50)
        //     .fontWeight(FontWeight.Bold)
        // }

        // 字符串方法
        // if (this.count% 7 == 0 || this.count.toString().includes('7')){
        //   Text('过')
        //     .fontSize(50)
        //     .fontWeight(FontWeight.Bold)
        //     .fontColor('red')
        // }else{
        //   Text(this.count.toString())
        //     .fontSize(50)
        //     .fontWeight(FontWeight.Bold)
        //     .fontColor('red')
        // }

        Text( this.count% 7 == 0 || this.count.toString().includes('7') ? '过' : this.count.toString())
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('red')

        Button('逢七过')
          .onClick(() => {
            this.count++
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}