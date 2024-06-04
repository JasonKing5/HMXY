/*
 * 1，申请网络权限
 * 2，诗词接口地址
 * https://api.apiopen.top/api/sentences
 *  GET
 * */
import http from '@ohos.net.http'
@Entry
@Component
struct Index {
  @State poem:string = 'ArkTS网络应用'
  @State origin:string = 'HarmonyOS'

  // 生命周期函数:当页面加载完成后自动触发
  aboutToAppear(){
    setInterval(()=>{
      //1.获取httpRequest对象
      let httpRequest = http.createHttp()
      // httpRequest.request(请求地址,配置参数对象,回调函数处理响应结果)
      httpRequest.request(
        'https://api.apiopen.top/api/sentences',
        {
          method:http.RequestMethod.GET
        },
        (err,data)=>{
          //如果有报错 err对象不为空。
          if (!err) {
            //解析响应内容
            this.poem = JSON.parse(`${data.result}`).result.name
            this.origin = JSON.parse(`${data.result}`).result.from
          }
        }
      )
    },3000)
  }
  build() {
    Column({ space: 10 }) {
      Text(this.poem).fontSize(20).fontColor(Color.Blue)
      Text(this.origin).fontSize(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}