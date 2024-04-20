// 页面跳转的第二个页面，目标页面
import router from '@ohos.router'

@Entry
@Component
struct TargetPage {
  @State message: string = '城市慷慨亮整夜光，少年不惧岁月长'

  build() {
    Row() {
      Column({space:40}) {
        Text(this.message)
          .fontSize(20)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bold)

      //   点击按钮返回按钮
        Button('返回')
          .onClick(()=>{
             router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}