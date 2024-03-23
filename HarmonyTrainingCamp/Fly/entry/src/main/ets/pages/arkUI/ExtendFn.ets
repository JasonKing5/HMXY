@Entry
@Component
struct ExtendFn {
  build() {
    Column({ space: 20 }) {
      // todo: 参数顺序问题：用对象啊
      // Text('style函数').textStyle('green',TextDecorationType.Overline)
      Text('21物联网').textStyle('red',20,TextDecorationType.LineThrough)
      Text('2101-2102').textStyle(Color.Blue)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

//扩展样式函数
@Extend(Text)
function textStyle(tColor: string | Color  ,fs:number=30,tdt:TextDecorationType=TextDecorationType.Underline) {
  .fontSize(fs)
  .fontColor(tColor)
  .fontStyle(FontStyle.Normal)
  .decoration({
    type: tdt,
    color: Color.Red
  })
}
