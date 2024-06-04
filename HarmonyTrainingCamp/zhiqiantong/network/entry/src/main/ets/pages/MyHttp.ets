// 发起网络请求。https://api.apiopen.top/api/sentences
//1 导入http模块
import http from '@ohos.net.http'

@Entry
@Component
struct MyHttp {
  @State poem: string = '愁云淡淡雨潇潇'
  @State from: string = '纳兰性德'

  // 生命周期函数：build函数渲染之前
  aboutToAppear() {
    setInterval(() => {
      //   2 获取请求对象
      let req = http.createHttp()
      //   3. 发请求
     let promise =  req.request('https://api.apiopen.top/api/sentences')
      promise.then((data) => {
        this.poem = JSON.parse(`${data.result}`).result.name
        this.from = JSON.parse(`${data.result}`).result.from
      })
    }, 3000)
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.poem)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text(this.from)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Divider()
      }
      .width('100%')
    }
    .height('100%')
  }
}