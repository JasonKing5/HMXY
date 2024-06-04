/*
 * counter组件
 * */
@Entry
@Component
struct Container04 {
  @State num: number = 0

  build() {
    Column({ space: 10 }) {
      Counter() {
        Text(this.num.toString())
      }
      .onInc(() => {
        this.num++
      })
      .onDec(() => {
        this.num--
        if (this.num <= 0) {
          this.num = 0
        }
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}