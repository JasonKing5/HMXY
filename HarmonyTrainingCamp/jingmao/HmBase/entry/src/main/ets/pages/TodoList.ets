/*
 * todo: 待办列表，触类旁通。掌握布局知识。和arkts。
 * */

@Entry
@Component
struct TodoList {

  build() {
    Column({space:20}) {
      Text('HarmonyOS4.0')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Divider()

      Row({space:30}){
        Image($r('app.media.logo'))
          .width(40)
        Text('收徒')
          .fontSize(25)
          .fontColor(Color.Gray)
          .decoration({type:TextDecorationType.LineThrough,color:Color.Red})
      }
      .width('80%')
      .height(60)
      .backgroundColor('#ffc4cee3')
      .padding({
        left:40
      })
      .borderRadius(30)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe8eeee')
    .justifyContent(FlexAlign.Center)
  }
}