@Entry
@Component
struct MyExtend {
  @State text1:string  ='鸿蒙OS'
  @State text2:string  ='HarmonyOS'
  @State text3:string  ='鸿蒙星河版'
  build() {
    Row() {
      Column({space:30}) {
        Text(this.text1)
          .textStyle(Color.Red,FontWeight.Normal,()=>{
            this.text1 += 1
          })
        Text(this.text2)
          .textStyle('#36d',FontWeight.Bold, () => {
            this.text2 += 2
          })
        Text(this.text3)
          .textStyle($r('app.color.start_window_background'),FontWeight.Lighter, () => {
            this.text3 += 3
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text)
function textStyle(tc:string | Color|Resource ,fw:FontWeight,myclick:Function) {
  .fontSize(30)
  .fontColor(tc)
  .fontWeight(fw)
  .fontStyle(FontStyle.Italic)
  .width('60%')
  .backgroundColor(Color.Gray)
  .textAlign(TextAlign.Center)
  .onClick(() => {
      myclick()
  })
}

