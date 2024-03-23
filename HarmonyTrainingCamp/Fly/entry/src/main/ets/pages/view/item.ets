@Component
export default struct item {
  content:string  = 'HarmonyOS'
  @State flag: boolean = false

  build() {
    Row({space:20}){
      Image( this.flag ?  $r('app.media.done')  : $r('app.media.undo') )
        .width(40)
        .onClick(() => {
          this.flag = !this.flag
        })
      Text(this.content)
        .decoration({type:this.flag ?TextDecorationType.LineThrough : TextDecorationType.None})

    }.rowSty()
  }
}
@Extend(Row)
function rowSty() {
  .width('70%')
  .height(60)
  .borderRadius(60)
  .padding({
    left:20
  })
  .backgroundColor(Color.White)
}
