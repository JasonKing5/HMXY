@Entry
@Component
struct ExtendFun {
  @State message: string = '@Extend'
  @State count:number = 0
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Text('HarmonyOS4.0').sizeColor(40,Color.Blue)
        Text('一键三联').sizeColor(40,'red')
        Text('下次一定').textStyle(20,'#ababab')
        Text('你干嘛~').textStyle(50,Color.Pink)

        Button(this.count.toString()).btnStyle( ()=>{
          this.count++
        } )
      }
      .width('100%')
    }
    .height('100%')
  }
}
@Extend(Text) function sizeColor(fs: number,fc:Color|string) {
  .fontSize(fs)
  .fontColor(fc)
}


@Extend(Text) function textStyle(fs: number,fc:Color|string) {
  .sizeColor(fs,fc)
  .fontStyle(FontStyle.Italic)
  .fontWeight(FontWeight.Bold)
}

@Extend(Button) function btnStyle(click:()=>void){
  .fontSize(40)
  .width(150)
  .height(50)
  .onClick(() => {
    click()
  })
}





