@Entry
@Component
struct Zuoye {
  @State sevent: number = 15
  build() {
    Row() {
      Column() {
        // if (this.sevent % 7 === 0 || this.sevent % 10 === 7 || Number.parseInt(`${this.sevent/10}`) ===7 ){
        if (this.sevent % 7 === 0 || this.sevent.toString().includes('7') ){
          Text('过')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }else{
          Text(this.sevent.toString())
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }

        Divider()
        Button('逢七过')
          .onClick(() => {
            this.sevent++
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}