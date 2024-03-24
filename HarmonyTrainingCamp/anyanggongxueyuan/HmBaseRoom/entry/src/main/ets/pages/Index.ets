import  Constants from  '../common/Constants'
@Entry
@Component
struct Index {
  @State message: string = '鸿蒙训练营';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')

    .backgroundColor(Constants.BGC)
  }
}