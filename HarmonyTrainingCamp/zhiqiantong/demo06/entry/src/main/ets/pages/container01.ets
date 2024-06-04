/*
 * 容器组件：Column
 * 参数：space
 * 属性方法：
 *  alignItems
 *  justifyContent
 * */
@Entry
@Component
struct container01 {
  build() {
    Column({ space: 10 }) {
      Text('1').width(200).height(50).backgroundColor(Color.Blue)
      Text('2').width(200).height(50).backgroundColor(Color.Brown)
      Text('3').width(200).height(50).backgroundColor(Color.Gray)
      Text('4').width(200).height(50).backgroundColor(Color.Pink)
    }
    .width('100%')
    .height('100%')
    // .justifyContent(FlexAlign.Center)
    // .justifyContent(FlexAlign.Start)
    // .justifyContent(FlexAlign.End)
    // .justifyContent(FlexAlign.SpaceBetween)
    // .justifyContent(FlexAlign.SpaceAround)
    .justifyContent(FlexAlign.SpaceEvenly)
    .alignItems(HorizontalAlign.Start)
    .alignItems(HorizontalAlign.End)
    .alignItems(HorizontalAlign.Center)
  }
}