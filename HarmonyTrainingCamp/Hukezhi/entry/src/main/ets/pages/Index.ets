import router from '@ohos.router';
import  Constants from  '../common/Constants'

@Entry
@Component
struct Index {
  @State message: string = '湖科技';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('goto show page').onClick((event: ClickEvent) => {
          router.pushUrl({
            url:"pages/Show"
          })
        })
        Divider()
        Button('goto todolist').onClick((event: ClickEvent) => {
          router.pushUrl({
            url:"pages/TodoList"
          })
        })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Constants.BGC)
  }
}