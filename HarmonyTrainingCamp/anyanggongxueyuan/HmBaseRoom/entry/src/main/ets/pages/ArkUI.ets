import Constants from '../common/Constants'

@Entry
@Component
struct ArkUI {
  @State message: string = '清空输入框'

 @State  arr:string[] = []

  build() {
    Column() {
      Text(this.message)
      //用户输入
      TextInput({placeholder:'请输入内容',text:this.message})
        .width('80%')
        .height(40)
        .backgroundColor(Color.Pink)
        // .type(InputType.Password)
        .placeholderColor(Color.Blue)
        .textAlign(TextAlign.Center)

        .onChange((value) => {
         this.message = value
        })
        .onSubmit(() => {
          this.arr.push(this.message)
          //回车清空输入框内容
          this.message = ''
        })


      Divider()

      ForEach(this.arr, (item:string) => {
        Text(item)
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Constants.BGC)
    .justifyContent(FlexAlign.Center)
  }
}