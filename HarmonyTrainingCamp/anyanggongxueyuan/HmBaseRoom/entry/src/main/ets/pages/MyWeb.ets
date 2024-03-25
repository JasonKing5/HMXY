import webview from '@ohos.web.webview'

@Entry
@Component
struct MyWeb {
  myController :WebviewController = new webview.WebviewController()

  build() {
    Row() {
      Column() {
          Web({
            src:'https://hm.codefe.cn/',
            controller:this.myController
          })

        // Image('https://hm.codefe.cn/assets/images/2020-09-03-juvenile-image-2-eb1f7786040b61d111429f8bee8744e3.png')
      }
      .width('100%')
    }
    .height('100%')
  }
}