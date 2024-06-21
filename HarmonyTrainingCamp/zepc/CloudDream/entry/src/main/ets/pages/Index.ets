import router from '@ohos.router'

@Entry
@Component
struct Index {

  // 自动执行
  aboutToAppear(){
    setTimeout(() => {
      router.replaceUrl({
        url:  "pages/MainShow"
      })
    },3000)
  }

  build() {
    Column({ space: 30 }) {
      Text($r('app.string.CloudDream'))
        .fontSize(40)
        .fontWeight(700)
      Text($r('app.string.orgin'))
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}