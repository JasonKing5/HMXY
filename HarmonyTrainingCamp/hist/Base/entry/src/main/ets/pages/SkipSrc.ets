// 跳转案例的第一个页面
import router from '@ohos.router'

@Entry
@Component
struct SkipSrc {
  @State message: string = '帝心'
  // 页面 组件  属性方法  事件函数
  build() {
    // 行
    Row() {
      // 列
      Column() {
        Text(this.message)
          .fontSize(50) //样式
          .fontWeight(FontWeight.Bold)

        Button('click...')
          .width('60%')
          .fontSize(30)
          .onClick(()=>{
            //页面跳转
            router.pushUrl({
              // 跳转页面 需要知道跳转到哪个页面
              url: "pages/SkipDest"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor('#ffc6e9de')
  }
}