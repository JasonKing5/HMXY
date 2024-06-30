// 使用web组件
import TopTitle from '../../view/TopTitle';
import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct WebComp {
  controller:WebviewController = new webview.WebviewController()
  build() {
    RelativeContainer() {
      TopTitle({message:'web组件'})
      Web({
        // src:'https://mp.weixin.qq.com/s/gty9SxI1uouXrNgqk8RlBQ',
        src:'https://mp.weixin.qq.com/mp/appmsgalbum?__biz=MzI0NDQ4MjE4MQ==&action=getalbum&album_id=1735879281185964038#wechat_redirect',
        // src:'https://hm.codefe.cn/',
        controller:this.controller
      })
        .domStorageAccess(true)
    }
    .height('100%')
    .width('100%')
  }
}