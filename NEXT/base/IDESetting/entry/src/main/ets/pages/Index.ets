// 本项目用来学习IDE配置

// todo: 注解标识。可以使用任务栏中TODO快速找到

// 当前行

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';



  build() {

    RelativeContainer() {

      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}