@Entry
@Component
struct ForEachTransition {
  @State poem: string[] = [
    '满堂花醉三千客，人生得意须尽欢。',
    '仰天大笑出门去，归来倚杖自叹息。',
    '天生我材必有用，会须一饮三百杯。',
    '最是人间留不住，千金散尽还复来。'
  ]
  num: number = 1

  build() {
    Column({ space: 10 }) {
      Column() {
        ForEach(this.poem, item => {
          Text(item).fet_text()
            .transition({
              type: TransitionType.All,
              translate: { x: 200, y: 100 }
            })
        }, item => JSON.stringify(item))
      }.fet_column()

      Button('向头部添加元素').fet_btn(Color.Orange, () => {
        animateTo({}, () => {
          this.poem.unshift('芙蓉帐暖度春宵,朕与将军解战袍' + this.num++)
          // console.log(this.poem.toString())
        })
      })
      Button('向尾部添加元素').fet_btn(Color.Green, () => {
        animateTo({}, () => {
            this.poem.push('问世间情为何物，两岸猿声啼不住' + this.num++)
        })
      })
      Button('删除头部元素').fet_btn(Color.Blue, () => {
        animateTo({}, () => {
            this.poem.shift()
        })
      })
      Button('删除尾部元素').fet_btn(Color.Red, () => {
        animateTo({}, () => {
          this.poem.pop()
        })
      })
    }
    .width('100%')
    .height('100%')
  }
}
// 存放诗词的容器样式
@Extend(Column) function fet_column() {
  .margin(10)
  .justifyContent(FlexAlign.Start)
  .alignItems(HorizontalAlign.Center)
  .width("90%")
  .height("50%")
}
// 诗词文本样式
@Extend(Text) function fet_text() {
  .width(300)
  .height(60)
  .fontSize(18)
  .margin({ top: 3 })
  .backgroundColor(Color.Pink)
  .textAlign(TextAlign.Center)
}
//按钮样式
@Extend(Button) function fet_btn(bgColor: Color, click: Function) {
  .width(200)
  .height(50)
  .fontSize(18)
  .backgroundColor(bgColor)
  .onClick(() => {
    // 此处的click是一个形参。具体代表的是调用除传进来的函数。后方跟小括号代表执行传进来的函数。
    click()
  })
}