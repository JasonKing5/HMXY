import { Language } from '../model/Data'

@Component
export default  struct  LanguageItem{
  item:Language = new Language('zh','中文')
  build() {
    Row() {
      Text(this.item.chinese)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }
    .card()
  }
}

//封装属性样式
@Extend(Row)
function card() {
  .justifyContent(FlexAlign.Center)
  .width("95%")
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .margin({ left: 5 })
  .shadow({ radius: 6, color: "#1F000000", offsetX: 2, offsetY: 4 }) //阴影
}