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

  constructor(temperature, humidity, info, wid, direct, power, aqi) {
    this.temperature = temperature
    this.humidity = humidity
    this.info = info
    this.wid = wid
    this.direct = direct
    this.power = power
    this.aqi = aqi
  }
}

// 未来5天每一天的数据类型
class FutureItem {
  date: string
  temperature: string
  weather: string
  wid: {
    day: string
    night: string
  }
  direct: string
}

@Entry
@Component
struct Show {
  @State message: string = 'show 天气'
  // 实时数据
  @State realtimeData: Realtime = new Realtime('18', '50', '多云', '01', '西北风', '2级', '60')
  // 未来五天数据
  @State futrueArr: Array<FutureItem> = []
  // 城市变量
  @State city: string = '荥阳'

  //获取天气预报数据
  aboutToAppear() {
    // http://apis.juhe.cn/simpleWeather/query?city=荥阳&key=个人的key  请换用自己的key进行访问
    //  51e3edda68a7fc46c788662dda49e871
    //  3eab6aaa9ee6faf4077d10017f7c6e0d
    let apiUrl = `http://apis.juhe.cn/simpleWeather/query?city=${this.city}&key=51e3edda68a7fc46c788662dda49e871`

    let httpObj = http.createHttp()

    let p = httpObj.request(apiUrl)
    p.then((data) => {
      console.log('请求成功：key还能用')

      let result = JSON.parse(data.result + '').result
      this.realtimeData = result.realtime
      this.futrueArr = result.future
    }).catch((err) => {
      console.log('请求失败：key可能超过50 了')
    })


  }

  // 封装布局函数。


  build() {
    Row() {
      Column({ space: 30 }) {
        Text(this.message)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Divider()

        Column({ space: 30 }) {
          Row({space:50}) {
            Text(this.city).fontSize(20)
            Text(this.realtimeData.temperature).fontSize(30)
              .fontColor(parseInt(this.realtimeData.temperature) > 35 ? Color.Red : Color.Green)
          //  可以根据温度情况，设置不同的图片显式
          }

          Row({ space: 30 }) {
            DataCln(this.realtimeData.humidity, '湿度')
            DataCln(this.realtimeData.info, '天气情况')
            DataCln(this.realtimeData.wid, '风速')
            DataCln(this.realtimeData.power, '风力')
            DataCln(this.realtimeData.aqi, '空气质量')
          }
        }

        Divider()

        List({space:20}){
          ForEach(this.futrueArr, (item: FutureItem, index: number) => {
            ListItem(){
              WeatherItem({item})
            }
          })
        }
        .width('100%')
        .layoutWeight(1)
        .alignListItem(ListItemAlign.Center)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.page_bgc'))
  }
}

@Builder
function  DataCln(dataValue, dataName) {
  Column({ space: 5 }) {
    Text(dataValue)
      .fontColor('#ff1595ea')
      .fontSize(16)
    Text(dataName)
  }
}

@Component
struct WeatherItem {
  item:FutureItem

  build() {
    Column({ space: 20 }) {
      Row({ space: 30 }) {
        Text(this.item.date)
        Text(this.item.temperature)
      }
      Row({ space: 20 }){
        DataCln(this.item.weather,'天气')
        DataCln( `${this.item.wid.day} / ${this.item.wid.night}`,'白天/夜间风力')
        DataCln(this.item.direct,'风向')
      }
    }
    .width('100%')
    .borderRadius(20)
    .backgroundColor('#ffa3ea77')
  }
}