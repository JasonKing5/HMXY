import router from '@ohos.router'

@Entry
@Component
struct Index {
  message: Resource = $r('app.string.title')

  build() {
    Row() {
      Column({space:20}) {
        Text(this.message)
          .fontColor('green')
          .fontSize(30)
          .fontWeight(700)
          .fontStyle(FontStyle.Italic)
        Divider()
        //html  css js
        Button('文本Text')
          .width('50%')
          .height(50)
          .backgroundColor('#74011a14')
          .onClick(() => {
            //业务逻辑，页面跳转
            router.pushUrl({
              url:'pages/TextDemo'
            })
          })
        Button('按钮Button')
          .width('50%')
          .height(50)
          .backgroundColor('#74011a14')
          .onClick(() => {
            //业务逻辑，页面跳转
            router.pushUrl({
              url:'pages/ButtonDemo'
            })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}