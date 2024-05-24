import router from '@ohos.router'

@Entry
@Component
struct TextComp {
  message: string = router.getParams()?.['title'] || '文本组件学习'
  age: number = 22

  build() {
    Column({ space: 30 }) {
      Text(this.message).fontSize(20)
      Divider()
      // 文本组件只能写两种内容。字符串和资源类型
      Text('字符串资源1：${this.age}单引号')
      Text("字符串资源2：双引号")
      Text(`字符串资源3：${this.age}反引号`)

      // 资源类型
      Text($r('app.string.EntryAbility_label'))

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}
