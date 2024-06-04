/*
 * row组件
 * 参数：space
 * 属性方法：
 *  alignItems
 *  justifyContent
 * */
@Entry
@Component
struct Container02 {

  build() {
    Row(){
      Text('1').width(70).height(50).backgroundColor(Color.Blue)
      Text('2').width(70).height(50).backgroundColor(Color.Brown)
      Text('3').width(70).height(50).backgroundColor(Color.Gray)
      Text('4').width(70).height(50).backgroundColor(Color.Pink)
    }
    .width('100%')
    .height('100%')
    // .alignItems(VerticalAlign.Top)
    .alignItems(VerticalAlign.Center)
    // .alignItems(VerticalAlign.Bottom)
    .justifyContent(FlexAlign.Start)
    .justifyContent(FlexAlign.Center)
    .justifyContent(FlexAlign.End)
    .justifyContent(FlexAlign.SpaceBetween)
    .justifyContent(FlexAlign.SpaceAround)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}