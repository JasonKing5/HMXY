import MyRouterInfo, { RouterParm } from '../model/MyRouterInfo'
import { router } from '@kit.ArkUI'


@Component
export default struct RouterItem {
  r: MyRouterInfo = new MyRouterInfo('pages/Index', '默认去首页')
  i: number = 1



  build() {
    Row() {
      Text(this.i + '.')
        .fontColor(Color.White)
      Blank()
      Text(this.r.title)
        .fontColor(Color.White)
        .fontSize(16)
    }
    .width('90%')
    .padding(12)
    .backgroundColor('#38f')
    .borderRadius(20)
    .shadow({
      radius: 6,
      color: '#4F000000',
      offsetX: 2,
      offsetY: 4
    })
    .onClick(() => {
      // router跳转
      router.pushUrl(
        {
          url: this.r.url,
          params:new RouterParm(this.r.title)
        },
        router.RouterMode.Single,
        err => {
          if (err) {
            console.log(`路由失败，errCode: ${err.code} errMsg:${err.message}`)
          }
        }
      )
    })
  }
}