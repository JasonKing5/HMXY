// 从服务端获取数据。展示到界面上渲染。
import http from '@ohos.net.http'

@Entry
@Component
struct UseHttp {
  @State message: string = '访问服务端展示数据'
  @State poem:string  = ''
  aboutToAppear(){
    // 定时器函数
    setInterval(() => {
      http.createHttp().request('https://api.apiopen.top/api/sentences', (err,data) => {
        this.poem = JSON.parse(`${data.result}`).result.name
      })
    },3000)
  }
  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Divider()
        Divider()
        Text(this.poem)
      }
      .width('100%')
    }
    .height('100%')
  }
}