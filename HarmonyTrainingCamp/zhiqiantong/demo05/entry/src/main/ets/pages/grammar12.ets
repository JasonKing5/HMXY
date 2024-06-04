/*
 * @Watch装饰器：状态变量更改通知
 * */
@Entry
@Component
struct Grammar12 {
  @State message:string = 'HarmonyOS'
  @State @Watch('onchange') count:number = 0
  onchange(){
    this.message = 'ArkTS' + this.count
  }
  build(){
    Column({ space: 10 }) {
      Text(this.message).fontSize(30)
      Button(`count变化: ${this.count}`)
        .onClick(()=>{
           this.count++
        })
        .fontSize(25)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}