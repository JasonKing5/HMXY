/*
 * 访问网络。获取数据。
 * */
import http from '@ohos.net.http';
import Contants from './common/Contants';


@Entry
@Component
struct Poem {
  @State poem: string = '莫道桑榆晚，为霞尚满天'
  @State auth: string = '刘禹锡'

  aboutToAppear(){
    // 定时器
    setInterval(() => {
      //发请求。设置数据
      let httpreq = http.createHttp()
      httpreq.request(Contants.POEM_API, (err,data) => {
        if (!err) {
          this.poem = JSON.parse(`${data.result}`).result.name
          this.auth = JSON.parse(`${data.result}`).result.from
        }
      })
    },3000)
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.poem).fontSize(20)
        Divider()
        Text(this.auth).fontSize(16).fontColor(Color.Green)


      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Contants.BG_COLOR)

  }
}