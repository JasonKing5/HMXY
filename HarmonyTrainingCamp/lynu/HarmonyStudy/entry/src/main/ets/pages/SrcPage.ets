// 页面跳转的第一个页面，源页面
import router from '@ohos.router'
@Entry
@Component
struct SrcPage {
  @State message: string = '少年不惧岁月长，彼方尚有荣光在'

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

      //   点击按钮跳转页面
        Button('去第二页')
          .onClick(() => {
              router.pushUrl({
                url:"pages/TargetPage"
              })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}