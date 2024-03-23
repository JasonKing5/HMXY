import router from '@ohos.router'

@Entry
@Component
struct Skip1 {
  @State message: string = 'one page。。。'

  build() {
    Row() {
      Column({space:30}) {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('goto ....2')
          .width('50%')
          .height(40)
          .onClick(()=>{
            //执行业务代码    去第二个页面
            router.pushUrl({
              url:  "pages/Skip2"
            })
          })


        Button('返回首页')
          .onClick(() => {
            router.back()
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}