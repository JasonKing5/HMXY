import http from '@ohos.net.http'

@Entry
@Component
struct MyHttp {
  @State message: string = '把酒祝东风'
  @State auth:string  = '柳宗元'
  @State acrostic:string  = '鸿蒙星河'
  // aboutToAppear(){
  //   setInterval(()=>{
  //     http.createHttp().request('https://api.apiopen.top/api/sentences',(err,data)=>{
  //       if (!err) {
  //         this.message = JSON.parse(`${data.result}` ).result.name
  //         this.auth =JSON.parse(`${data.result}` ).result.from
  //       }
  //     })
  //   },3000)
  // }

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message) .fontSize(20)
        Text(this.auth).fontSize(16)
        Divider()
        Button('give me poem')
          .onClick(()=>{
            http.createHttp().request('https://api.apiopen.top/api/sentences',(err,data)=>{
              if (!err) {
                this.message = JSON.parse(`${data.result}`).result.name
                this.auth = JSON.parse(`${data.result}`).result.from
              }
            })
          })
        
        Divider()
        TextInput({text:this.acrostic})
          .onChange((value)=>{
            this.acrostic = value
          })
          .onSubmit(()=>{
            http.createHttp().request('https://py.myie9.com/hidepoem/'+this.acrostic,(err,data)=>{
              if (!err) {
                this.acrostic = `${data.result}`
              }
            })
          })

        Text(this.acrostic)
        /*
         * http://apis.juhe.cn/simpleWeather/query
         * get
         *  city：安阳
         *  key:45014af2b7482307cdf6fac17d96b8fb
         * url: http://apis.juhe.cn/simpleWeather/query?city=安阳&key=45014af2b7482307cdf6fac17d96b8fb
         * */
        Divider()
        Button('天气预报')
          .onClick(()=>{
            http.createHttp().request('http://apis.juhe.cn/simpleWeather/query?city=安阳&key=45014af2b7482307cdf6fac17d96b8fb',(err,data)=>{
              if (!err) {
                console.log(`${data.result}`)
              //   具体UI自己参考常用天气预报界面设计（tabs切换，list列表，容器布局，不同图片对应不同天气等，）。将天气内容解析到界面呈现。
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}