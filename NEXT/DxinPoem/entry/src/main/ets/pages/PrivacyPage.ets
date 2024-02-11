// 隐私协议详情页面
import router from '@ohos.router'

@Entry
@Component
struct PrivacyPage {

  build() {
    Row() {
      Column() {
        Text('自行设计和布局该页面内容！').fontColor(Color.Red)
        Text($r('app.string.user_privacy_label'))
        Text($r('app.string.user_privacy_content'))
          .fontSize(30)
      }
      .width('100%')
    }
    .height('100%')
    .onClick(() => {
      router.back()
    })
  }
}