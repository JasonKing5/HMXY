@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State public  listX:number = -120
  
  @State cityList:string[] = ['北京','上海','广州','深圳','成都','武汉','南京','杭州','苏州','无锡','天津','平顶山','周口','郑州']

  @State weatherObj:object =  {
    "city": "安顺",
    "cityid": 111,
    "citycode": "101260301",
    "date": "2023-12-05",
    "week": "星期二",
    "temp": "9.7",
    "temphigh": "10",
    "templow": "6",
    "humidity": "100",
    "pressure": "845",
    "windspeed": "3.5",
    "winddirect": "东风",
    "windpower": "2级",
    "updatetime": "2023-12-05 15:00:00",
    "hourly": [{
      "time": "9:00",
      "weather": "阴",
      "temp": "8",
      "img": 2
    },
      {
        "time": "10:00",
        "weather": "阴",
        "temp": "8",
        "img": 2
      },
      {
        "time": "11:00",
        "weather": "阴",
        "temp": "9",
        "img": 2
      },
      {
        "time": "12:00",
        "weather": "阴",
        "temp": "9",
        "img": 2
      },
      {
        "time": "13:00",
        "weather": "阴",
        "temp": "10",
        "img": 2
      },
      {
        "time": "14:00",
        "weather": "阴",
        "temp": "10",
        "img": 2
      },
      {
        "time": "15:00",
        "weather": "雾",
        "temp": "10",
        "img": 18
      }
    ],
    "weather": "雾",
    "img": "18"
  }

  build() {
    Stack({alignContent:Alignment.Top}){

      Flex({direction:FlexDirection.Column}){
        Stack({alignContent:Alignment.Top}){
          Image('/images/weather.png')
            .width('100%')
            .height('100%')

          Flex({direction:FlexDirection.Column}){
            Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
              Image('/images/set.png')
                .width(20)
                .height(20)
                .onClick(()=>{
                  animateTo({duration:200},()=>{
                    this.listX = 0
                  })

                })
              Text('安顺')
                .fontColor(Color.White)
                .fontSize(30)
              Image('/images/search.png')
                .width(20)
                .height(20)
            }
            // .margin({top:30})
            .padding({left:20,right:20})
            .width('100%')
            .height('20%')

            Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.Center}){
              Text(`${this.weatherObj['temp']}` + '℃')
                .fontSize(80)
                .fontColor(Color.White)
              Text(`${this.weatherObj['weather']}` + '，' + `${this.weatherObj['winddirect']}` + `${this.weatherObj['windpower']}`)
                .fontSize(20)
                .fontColor(Color.White)
            }
            .width('100%')
            .height('60%')

            Row(){
            }
            .width('100%')
            .height('20%')
          }
          .width('100%')
          .height('100%')
        }
        .width('100%')
        .height('66%')

        Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.Center}){
          Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
            Text('today')
              .fontColor(Color.Black)
              .fontSize(25)
              .fontWeight(600)

            Text('Lucknow,Uttar praders')
              .fontColor(Color.Black)
              .fontSize(15)

          }
          .width('100%')

          List({space:30}){
            ForEach(this.weatherObj['hourly'],(item:object)=>{
              ListItem(){
                Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.SpaceBetween,alignItems:ItemAlign.Center}){
                  Text(item['time'])
                    .fontColor(Color.Black)
                    .fontSize(15)
                  Image('/images/icon.png')
                    .width(40)
                    .height(40)
                    .objectFit(ImageFit.Auto)
                  Text(item['temp'])
                    .fontColor(Color.Black)
                    .fontSize(15)
                }
              }

            })

          }
          .listDirection(Axis.Horizontal)
          .margin({top:40})
          .height(100)


        }
        .padding(30)
        .width('100%')
        .height('34%')


      }
      .width('100%')
      .height('100%')
      .padding(0)
      .margin(0)

      Flex({direction:FlexDirection.Row}){

        List(){
          ForEach(this.cityList,(item:string)=>{
            ListItem(){
              Text(item)
                .fontColor(Color.Black)
                .fontSize(18)
                .width(120)
                .textAlign(TextAlign.Center)
            }
            .height(50)
            .onClick(()=>{
              console.log("子组件方法")
              animateTo({duration:200},()=>{
                this.listX = -120
              })
            })
          })
        }
        .backgroundColor(Color.White)
        .position({x:this.listX,y:0})
        .divider({ strokeWidth: 2, color: Color.Gray, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
        .width(120)
        .height('100%')

        Image('/images/add.png')
          .width(70)
          .height(70)
          .position({x:'75%',y:'62%'})
      }

    }
    .padding(0)
    .margin(0)
  }
}

