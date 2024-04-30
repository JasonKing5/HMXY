// 网络请求多种用法： 原生http模块  promise  第三方模块axios或者其他
import http from '@ohos.net.http'

@Entry
@Component
struct MyHttp {
  @State message: string = 'http请求'

  build() {
    Column({ space: 30 }) {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Divider()
      Button('从互联网获取数据')
        .onClick(() => {
          //https://api.apiopen.top/api/sentences
          http.createHttp().request('https://api.apiopen.top/api/sentences', (err, data) => {
            if (!err) {
              //从data身上拿数据
              this.message = JSON.parse(data.result + '').result.name
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}

