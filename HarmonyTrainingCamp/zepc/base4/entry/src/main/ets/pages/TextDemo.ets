// 本页面用来学习text组件
import router from '@ohos.router'

@Entry
@Component
struct TextDemo {
  build() {
    Row() {
      Column() {
        Text('学习text组件')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')

  }
}