import router from '@ohos.router'

let courseName = router.getParams()['courseName'] as string

@Entry
@Component
struct LifeCycle2 {
  @State message: string = 'page2'

  build() {
    Row() {
      Column({space : 30}) {
        Text(courseName).fontSize(30)
        Divider()
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
    .onClick(() => {
      router.back()
    })
  }

  onPageShow(){
    console.log('page2....onPageShow')
  }
  onPageHide(){
    console.log('page2....onPageHide')
  }
  onBackPress(){
    console.log('page2....onBackPress')
  }
}