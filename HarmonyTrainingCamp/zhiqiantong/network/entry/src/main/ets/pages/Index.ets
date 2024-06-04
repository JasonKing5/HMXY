/*
 * 使用web组件加载网页文件
 * */
import webview from '@ohos.web.webview'
@Entry
@Component
struct Index {
  @State message: string = '网络知识'

  myController:WebviewController = new webview.WebviewController()
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.myController.loadUrl('https://www.bilibili.com/')
          })
        Divider()
        Web({
          src:'https://developer.harmonyos.com/',
          controller:this.myController
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}