import http from '@ohos.net.http';
let httptest:http.HttpRequest
@Entry
@Component
struct HttpTest {
  @State message: string = '测试网络请求';

  aboutToAppear(): void {
    httptest = http.createHttp()
  }
  build() {
    Row() {
      Column() {
        Button(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            httptest.request('https://wwww.baidu.com/',(err,data)=>{
              console.log('总该打印吧111')
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}