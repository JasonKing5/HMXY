@Entry
@Component
struct MyStyle {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message).myStyle()

        Image('').myStyle()
        Button('btn').myStyle()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Styles
function myStyle(){

  .width('80%')
  .height(50)
  .backgroundColor('#36d')
}