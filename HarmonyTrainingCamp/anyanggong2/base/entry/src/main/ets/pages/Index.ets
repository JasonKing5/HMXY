import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = '入口页面';

  build() {
    Row() {
      Column({space:20}) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Divider()
          .color('#ffea3737')
        Button('点我去文本组件预览')
          //事件函数 点击事件：当点坤这个按钮的时候去干点事。。。。。这个描述，不是属性方法的描述。业务逻辑。
          .onClick( ()=>{
              router.pushUrl({
                url:'pages/ZuJianStudy'
              })
          } )

        Button('点我去看图片效果')
          .onClick(() => {
              router.pushUrl({
                url:"pages/ImageStudy"
              })
          })

        Button('点我去poem')
          .onClick(() => {
            router.pushUrl({
              url:  "pages/Poem"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}