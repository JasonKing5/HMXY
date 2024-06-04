/*
 * 状态管理 : @Prop
 *
 * @state --> @Prop
 * */
@Entry
@Component
struct Grammar08 {
  @State num1: number = 30

  build() {
    Column() {
      Grammar08_son({ age: this.num1 })
      Button('老去一岁')
        .onClick(() => {
          this.num1 += 1
        })
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct Grammar08_son {
  @Prop age: number

  build() {
    Column() {
      Text(`我${this.age}岁了`).fontSize(40)

    }
  }
}