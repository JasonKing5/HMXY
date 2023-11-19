import router from '@ohos.router'
import CommonConstant from  '../common/CommonConstant'
@Entry
@Component
struct Index {
  @State message: string = 'HarmonyOS4.0基础知识完证项目'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(CommonConstant.BACKGROUND)
    .onClick(() => {
      router.pushUrl({
        url:"pages/TodoList",
        params:{
          appName : 'HarmonyOS4.0'
        }
      })
    })

  }
}