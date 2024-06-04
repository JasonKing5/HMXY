/*
 *  Flex弹性布局组件
 *  参数：
 *  direction：
 *  FlexDirection.Row、FlexDirection.RowReverse、FlexDirection.Column、FlexDirection.ColumnReverse、
 *  wrap:
 *    FlexWrap.Wrap、FlexWrap.NoWrap、FlexWrap.WrapReverse换行并且翻转
 *  justifyContent:
 *    FlexAlign.Center、FlexAlign.Start 、FlexAlign.End 、...
 *  alignItems:侧轴对其方式，高度不同的时候才能体现
 *    ItemAlign.End、ItemAlign.Auto、ItemAlign.Start、ItemAlign.Stretch(拉伸高度)、...
 *  alignContent: 多行子布局下 子组件的布局情况。。所以需要有父子组件进行演示
 *    FlexAlign.SpaceBetween、。。。
 * */
@Entry
@Component
struct Container03 {
  build() {
    Column({ space: 10 }) {
      Text('flex组件').fontSize(40).fontColor(Color.Blue)
      Flex({
        // direction:FlexDirection.RowReverse,
        direction:FlexDirection.Row,
        wrap:FlexWrap.Wrap,
        justifyContent:FlexAlign.SpaceAround,
        alignItems:ItemAlign.Stretch
      }){
        Text('1').width('20%').height(50).backgroundColor(0xf5deb3)
        Text('2').width('20%').height(50).backgroundColor(0xd2beb3)
        Text('3').width('20%').height(50).backgroundColor(0xf5deb3)
        Text('4').width('20%').height(50).backgroundColor(0xd2beb3)
        Text('5').width('20%').height(50).backgroundColor(0xf5deb3)
        Text('6').width('20%').height(50).backgroundColor(0xd2beb3)
        Text('7').width('20%').height(70).backgroundColor(0xf5deb3)
        Text('8').width('20%').height(90).backgroundColor(0xd2beb3)
      }
      .width('80%')
      .height('80%')
      .padding(10)
      .backgroundColor(0xafeeee)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}