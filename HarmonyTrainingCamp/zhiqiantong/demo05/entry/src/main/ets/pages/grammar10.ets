/*
 * @Link、@State和@Prop结合使用示例
 * */
@Entry
@Component
struct Grammar10 {
  @State counter: number = 0

  build() {
    Column() {
      Button(`father:(${this.counter}) + 1`)
        .fontSize(30)
        .margin(15)
        .onClick(() => {
          this.counter += 1
        })
      Divider()
      ChildA({counterVal:this.counter})
      Divider()
      ChildB({counterRef:$counter})
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct ChildA {
  @Prop counterVal: number

  build() {
    Button(`ChildA:(${this.counterVal}) + 1`)
      .fontSize(30)
      .margin(15)
      .onClick(() => {
        this.counterVal += 1
      })
  }
}

@Component
struct ChildB {
  @Link counterRef: number

  build() {
    Button(`ChildB:(${this.counterRef}) + 1`)
      .fontSize(30)
      .margin(15)
      .onClick(() => {
        this.counterRef += 1
      })
  }
}
