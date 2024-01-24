/*
 * 发起http请求
 * */
// 1:导入http模块
import http from '@ohos.net.http'

@Entry
@Component
struct HttpReq {
  @State poem: string = '把酒祝东风'
  @State from: string = '柳宗元'

  aboutToAppear() {
    setInterval(() => {
      // 2. 常见http请求对象
      let httpReq = http.createHttp()
      // 3. 发起请求
      httpReq.request('https://api.apiopen.top/api/sentences',
        {
          method: http.RequestMethod.GET,
        },
        (err, data) => {
          // 4. 处理结果
          if (!err) {
            this.poem = JSON.parse(`${data.result}`).result.name
            this.from = JSON.parse(`${data.result}`).result.from
          }
        }
      )
    }, 2000)
  }

  build() {
    Row() {
      Column() {
        Text(this.poem)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text(this.from)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}