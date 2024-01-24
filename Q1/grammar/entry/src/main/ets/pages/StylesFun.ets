/*
 * 自定义样式函数使用装饰器：@Styles
 *  内部优先级>外部
 *  内部不需要function。
 *  外部需要function。
 *  弊端：只能写通用样式。不能传参
 * */
@Entry
@Component
struct StylesFun {
  @State message: string = '@Styles'

  // 内部样式函数 不需要function
  @Styles commonStyle(){
    .width(200)
    .height(100)
    .backgroundColor(Color.Gray)
  }

  build() {
    Row() {
      Column({space:20}) {
        Text(this.message).fontSize(40).commonStyle()
        Button().commonStyle()
        Image('').commonStyle()
        Row(){}.commonStyle()
      }
      .width('100%')
    }
    .height('100%')
  }
}
// 外部通用样式函数 func
@Styles function commonStyle(){
  .width(250)
  .height(50)
  .backgroundColor(Color.Gray)
}
