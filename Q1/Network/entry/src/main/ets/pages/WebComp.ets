/*
 * web组件用来加载网页:记得申请网络权限....并不支持预览器
 *  src:''
 *  控制器
 * */
import webview from '@ohos.web.webview'
@Entry
@Component
struct WebComp {
  // 准备一个web组件的控制器
  myController:WebviewController = new webview.WebviewController()

  build() {
    Row() {
      Column() {
        Web({
          src:'https://www.bilibili.com/video/BV1pb4y1g75m/?spm_id_from=333.337.search-card.all.click&vd_source=5ffbecb310ecff5ac81127e5993454f0',
          controller:this.myController
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}