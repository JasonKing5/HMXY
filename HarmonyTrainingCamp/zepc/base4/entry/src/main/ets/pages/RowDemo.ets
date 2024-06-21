// 布局容器
@Entry
@Component
struct RowDemo {

  // 构建页面
  build() {
    Row(){
      // Text('一行排列')
      // Button('我乱入')
      Image($rawfile('gege.jpg'))
        .width(200)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#abc')
    //主轴的排列方式
    .justifyContent(FlexAlign.Start)
    .justifyContent(FlexAlign.Center)
    .justifyContent(FlexAlign.End)
    //设置侧轴的排列方式
    .alignItems(VerticalAlign.Top)
    .alignItems(VerticalAlign.Bottom)
    .alignItems(VerticalAlign.Center)
  }
}