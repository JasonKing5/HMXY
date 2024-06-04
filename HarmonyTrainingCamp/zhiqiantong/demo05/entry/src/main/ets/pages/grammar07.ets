/*
 * 状态管理 : @state
 * */
@Entry
@Component
struct Grammar07 {
  @State message:string = 'Hello World'
  build() {
    Column({space:30}){
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Button('点击改变数据')
        .onClick(()=>{
           this.message = '欢迎您学习HarmonyOS'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}