@Entry
@Component
struct Zuoye {
  @State sevent: number = 15

  build() {
    Row() {
      Column() {
        // if (是7的倍数和或者包含7){
        //   Text('过')
        //     .fontSize(50)
        //     .fontWeight(FontWeight.Bold)
        // }else{
        //   Text(this.sevent.toString())
        //     .fontSize(50)
        //     .fontWeight(FontWeight.Bold)
        // }

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