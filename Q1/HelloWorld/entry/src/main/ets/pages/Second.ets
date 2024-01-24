import router from '@ohos.router'
@Entry
@Component
struct Second {
  build() {
    Column() {
      Text('庄生老师')
        .fontSize(50)
    }
    .width('100%')
    .height('100%')
    .onClick(()=>{
      router.back()
    })
  }
}