import { PoemModel } from '../model/Model'
import TopBack from '../view/TopBack'


@Entry
@Component
struct CollPoem {

  //暂时写死，实际上会从被保存的地方获取
  @State poems:PoemModel [] = AppStorage.Get('poem') || [new PoemModel('我是梦中传彩笔 欲书花叶寄朝云','无题','彩笔','宋')]

  build() {
    Row() {
      Column({space:30}) {
        //返回按钮
        TopBack()
        //当前页的标题
        Text('收藏过的诗句').fontSize(25).fontColor('#ff136ac1')
        Divider()

        List({space:30}){
          ForEach(this.poems,(item:PoemModel,index:number)=>{
            ListItem(){
              Column(){
                Row({space:30}){
                  Text(index + '').fontSize(20).fontColor('#ffd74444')
                  Text(item.content).fontSize(20)
                    .textOverflow({overflow:TextOverflow.Ellipsis})
                    .maxLines(1)
                }
                .width('100%')
                // .backgroundColor('red')
                .justifyContent(FlexAlign.Center)

                //第二行 题目和作者
                Row({space:50}){
                  Text(  '《' + item.origin + '》').fontSize(20)
                  Text(  '-----'+ item.author).fontSize(16).fontColor('#ffc832bb')
                }
              }
            }
          })
        }
        .width('100%')
        .layoutWeight(1)
        .alignListItem(ListItemAlign.Center)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.app_bgc'))

  }
}