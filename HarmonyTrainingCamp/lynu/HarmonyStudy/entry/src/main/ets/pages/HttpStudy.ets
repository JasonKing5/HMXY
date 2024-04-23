// 学习访问服务器获取数据：发送网络请求
import http from '@ohos.net.http'

@Entry
@Component
struct HttpStudy {
  @State message: string = '学习http'
  @State poem: string = '洛阳城东桃李花，飞来飞去落谁家'

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Button('点击获取服务端数据')
          .onClick(() => {
            //发请求
            http.createHttp().request("https://api.apiopen.top/api/sentences", (err, data) => {
              if (!err) {
                this.poem = JSON.parse(`${data.result}`).result.name
              }
            })

          })

        Text(this.poem)
      }
      .width('100%')
    }
    .height('100%')
  }
}