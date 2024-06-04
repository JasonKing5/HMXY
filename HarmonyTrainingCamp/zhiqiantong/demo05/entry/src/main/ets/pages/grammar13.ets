/*
 * 渲染控制
 * 1.条件渲染
 * 2.循环渲染
 * */
@Entry
@Component
struct Grammar13 {
  @State count: number = 1
  @State arr: string[] = ['PC', '问界', '平板', '手表']

  build() {
    Column({ space: 10 }) {
      Text('条件渲染小游戏--逢7过').fontSize(30).fontColor('green')
      if (this.count % 7 === 0 || this.count % 10 === 7) {
        Text('过').fontSize(30)
      } else {
        Text(`${this.count}`).fontSize(30)
      }
      Button('逢7过').onClick(() => {
        this.count++
      })
        .fontSize(30)
      Divider()
      Text('循环渲染--产品类别').fontSize(30).fontColor('green')
      ForEach(this.arr,(item:string)=>{
        Text(item).fontSize(20)
      },item=> item )
      Button('翻转数据').onClick(() => {
        this.arr.reverse()
      })
        .fontSize(30)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}