/*
 * 访问网络。获取数据。
 * */
import http from '@ohos.net.http';


@Entry
@Component
struct Poem {
  @State poem: string = '';
  @State auth: string = ''
  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.poem).fontSize(20)
        Text(this.auth).fontSize(16).fontColor(Color.Green)
        Divider()
        Button('换一句诗词')
          .onClick(() => {
            // 获取网络请求对象
            let httpreq = http.createHttp()
            // 发送网络请求获取数据 ： 找谁要数据  https://api.apiopen.top/api/sentences
            httpreq.request('https://api.apiopen.top/api/sentences', (err,data) => {
              if (!err) {
                this.poem = JSON.parse(`${data.result}`).result.name
                this.auth = JSON.parse(`${data.result}`).result.from
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}