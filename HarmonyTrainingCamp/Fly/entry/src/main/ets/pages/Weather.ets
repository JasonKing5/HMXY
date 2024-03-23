import http from '@ohos.net.http'
import Contants from './common/Contants'

@Entry
@Component
struct Weather {

 @State futureArr:string[] = []

  build() {
    Row() {
      Column() {
        Button('get weather')
          .onClick(() => {
            http.createHttp().request(Contants.WEATHER_API+'?city=广汉&key='+Contants.KEY, (err,data) => {
              if (!err) {
                // console.log( JSON.stringify( JSON.parse(`${data.result}`).result.future) )
                this.futureArr = JSON.parse(`${data.result}`).result.future
                // console.log( JSON.stringify(this.futureArr))
              }
            })
          })
        Divider()
        // Text(JSON.stringify(this.futureArr))

        ForEach(this.futureArr, (item,index) => {
          // Text(JSON.stringify(item))
          Row({space:20}){
            Text(item.weather)
            Text(item.date)
            Text(item.temperature)
          }

          Divider()
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}