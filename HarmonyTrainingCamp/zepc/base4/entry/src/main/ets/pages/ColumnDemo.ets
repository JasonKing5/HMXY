// 列布局
@Entry
@Component
struct ColumnDemo {

  build() {
    Column(){
      Text('一行排列')
      Button('我乱入')
      Image($rawfile('gege.jpg'))
        .width(200)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffddc1c1')
    .justifyContent(FlexAlign.SpaceBetween)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}