import http from '@ohos.net.http'

//实时天气数据类
class Realtime {
  temperature: string
  humidity: string
  info: string
  wid: string
  direct: string
  power: string
  aqi: string

  constructor(temperature,humidity,info,wid,direct,power,aqi) {
    this.temperature = temperature
    this.humidity=humidity
    this.info = info
    this.wid = wid
    this.direct = direct
    this.power = power
    this.aqi = aqi
  }

}

// 未来5天每一天的数据类型
class FutureItem{
  date:string
  temperature:string
  weather:string
  win:{
    day:string
    night:string
  }
  direct:string
}

@Entry
@Component
struct Show {
  @State message: string = 'show 天气'
  // 实时数据
  @State realtimeData:Realtime = new Realtime('18','50','多云','01','西北风','2级','60')
  // 未来五天数据
  @State futrueArr:Array<FutureItem> =[]


  //获取天气预报数据
  aboutToAppear() {
    // http://apis.juhe.cn/simpleWeather/query?city=荥阳&key=个人的key  请换用自己的key进行访问
    let apiUrl = `http://apis.juhe.cn/simpleWeather/query?city=荥阳&key=45014af2b7482307cdf6fac17d96b8fb`
    http.createHttp().request(apiUrl, (err, data) => {
      if (!err) {
        let result = JSON.parse(data.result + '').result
        this.realtimeData =result.realtime
        this.futrueArr = result.future
      }
    })
  }

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()

        Text('此时天气数据')
        Text('气温' + this.realtimeData.temperature)
        Text('湿度' + this.realtimeData.humidity)
        Text('天气情况' + this.realtimeData.info)
        Text('风速' + this.realtimeData.wid)
        Text('风向' + this.realtimeData.direct)
        Text('风力' + this.realtimeData.power)
        Text('空气质量' + this.realtimeData.aqi)

        Divider()

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.page_bgc'))
  }
}