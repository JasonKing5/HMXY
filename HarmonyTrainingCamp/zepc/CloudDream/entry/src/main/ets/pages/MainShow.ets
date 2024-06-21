import http from '@ohos.net.http'

@Entry
@Component
struct MainShow {
  @State content: string = '日拱一卒无有尽，功不唐捐终入海'

  build() {
    Column({ space: 30 }) {
      Text(this.content)
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      // 这句诗词从网络获取。第一步配置网络权限。
      //2: 发送网络请求。获取响应结果。
      http.createHttp().request('https://v1.jinrishici.com/all.json', (err, data) => {
        // 向服务端接口要数据。如果有错误，err表示。如果没错误。从data身上拿数据
        let poem = data.result
        let tempStr = JSON.parse(poem + '').content
        this.content = tempStr
      })

    })
  }
}