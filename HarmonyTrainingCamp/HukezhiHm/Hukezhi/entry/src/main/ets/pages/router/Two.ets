import router from '@ohos.router'



@Entry
@Component
struct Two {
  @State name: string = ''
  @State age: string = ''

  // 生命周期函数
  aboutToAppear(){
    //router.getParams()  {xx:xx}  undefined
    // router.getParams()['name']   {xx:xx}.xx    undefined.xx
    this.name = router.getParams()?.['name'] || 'su'
    this.age = router.getParams()?.['age'] ||  '7'
  }


  build() {
    Column({space:50}) {
      Text(`欢迎${this.name}同学`)
      Text(`你今年${this.age}岁了`)

      Button('back')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}