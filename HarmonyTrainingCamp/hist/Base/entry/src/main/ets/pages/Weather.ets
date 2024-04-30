// 天气预报项目
import http from '@ohos.net.http'

@Entry
@Component
struct Weather {
  @State message: string = '天气预报'

  build() {
    Row() {
      Column({ space: 30 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Button('get weather data')
          .onClick(() => {
            http.createHttp().request('http://apis.juhe.cn/simpleWeather/query?city=新乡&key=45014af2b7482307cdf6fac17d96b8fb', (err,data) => {
              if (!err) {
               JSON.parse(`${data.result}`)
                console.log(data.result + '')
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}