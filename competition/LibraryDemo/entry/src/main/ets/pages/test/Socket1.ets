import http from '@ohos.net.http'

@Entry
@Component
struct Socket1 {
  @State message: string = '测试套接字'

  aboutToAppear(){
    http.createHttp().request('http://112.125.89.8:45041').then((data) => {
      console.log(` res: ${data.result}`)
    })
  }

  build() {
    Column({ space: 30 }) {
      Text(this.message)

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}