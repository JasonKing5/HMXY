import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State title: Resource = $r('app.string.App_title')

  // 生命周期
  aboutToAppear(){
    // 两秒后跳转
    setTimeout(() => {
      //跳转到数据展示页面
      router.pushUrl({
        url: "pages/Show"
      })
    },2000)
  }
  build() {
    Row() {
      Column({space:30}) {
        Image($r('app.media.weatherIcon'))
          .width(80)
        Text(this.title)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text('欢迎使用我们自己开发的天气预报app')
          .fontColor('#ff75ee49')
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.page_bgc'))
  }
}