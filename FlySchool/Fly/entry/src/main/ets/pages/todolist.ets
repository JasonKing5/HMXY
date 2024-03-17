import item from './view/item'

@Entry
@Component
struct todolist {
  arr:Array<string> = []
  aboutToAppear(){
    //在此处准备数据。发送网络请求获取数据。
   this.arr =  ['中飞院','星河滚烫','你是人间理想','满船清梦压星河']
  }
  build() {
    Column({space:20}) {
      Text('HarmonyOS中飞院')
        .fontSize(30)
        .fontWeight(FontWeight.Lighter)
      Divider()
      ForEach(this.arr, (dxin:string,index:number) => {
        item({content: index + '    ' + dxin })
      })
    }
    .clnStyle()
  }
}

@Extend(Column)
function clnStyle() {
  .width('100%')
  .height('100%')
  .justifyContent(FlexAlign.Center)
  .backgroundColor('#d8e9d8')
}
