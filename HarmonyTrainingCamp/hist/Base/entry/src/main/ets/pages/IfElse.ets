@Entry
@Component
struct IfElse {
 @State age: number = 17

  build() {
    Column({ space: 30 }) {
      if (this.age > 18) {
        Text('成年了。请无视风险。')
      } else {
        Text('FBI：未成年不允许。。。。')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.age++
      console.log(this.age + '')
    })
  }
}