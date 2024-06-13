import web_Webview from '@ohos.web.webview'
@Entry
@Component
struct PrivacyPage {
  controller: web_Webview.WebviewController = new web_Webview.WebviewController()

  onPageShow() {
    this.controller.loadData(
      "<html><body bgColor=\"white\">Source:<pre>source<pre></body></html>",
      "text/html",
      "UTF-8"
    )
  }

  build() {
    Column() {
      Web({
        src: 'https://nxyx.lsyzw.net/scorersPrivacyAgreement.html',
        controller: this.controller
      })
    }
  }
}