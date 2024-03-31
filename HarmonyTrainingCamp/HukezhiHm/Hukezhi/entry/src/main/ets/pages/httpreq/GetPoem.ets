import http from '@ohos.net.http'
import Constants from '../../common/Constants'

@Entry
@Component
struct GetPoem {
  @State poem: string = '何事人间频乞乞食，此心已是负彩霞'
  @State auth: string = '帝心'



  aboutToAppear(){
    setInterval(() => {
      let httpObj =  http.createHttp()
      //切记不要忘记在src/main/module.json5中申请网络权限
      httpObj.request('https://api.apiopen.top/api/sentences', (err,data) => {
        if (!err) {
          this.poem = JSON.parse(`${data.result}`).result.name
          this.auth = JSON.parse(`${data.result}`).result.from
        }
      })
    },1000)

  }


  build() {
    Column({space:30}) {
      Text(this.poem).fontSize(20)
      Text(this.auth).fontSize(20)

      Button('give me one poem')
        .onClick(() => {
            //使用http对象。发请求。找服务器要数据。用数据赋值变量自动更新UI
         let httpObj =  http.createHttp()
          //切记不要忘记在src/main/module.json5中申请网络权限
          httpObj.request('https://api.apiopen.top/api/sentences', (err,data) => {
            if (!err) {
              this.poem = JSON.parse(`${data.result}`).result.name
              this.auth = JSON.parse(`${data.result}`).result.from
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Constants.BGC)
    .justifyContent(FlexAlign.Center)
  }
}