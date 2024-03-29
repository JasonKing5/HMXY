import router from '@ohos.router'
import Constants from '../common/Constants'

@Entry
@Component
struct Show{
  @State poem:string = '日拱一卒无有尽，功不唐捐终入海'
  build(){
    // 列容器
    Column({space:30}){
      Text('HarmonyOSHarmonyOSHarmonyOS')
        // 属性方法用来修饰样式
        .fontColor(Color.Blue)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .maxLines(1)
        .textOverflow({
          // overflow:TextOverflow.Ellipsis
          // overflow:TextOverflow.None
          overflow:TextOverflow.Clip
        })
        .fontSize(20)
        .width('70%')
        .height(150)
        .backgroundColor(Color.Gray)
        .decoration({
          // type:TextDecorationType.Overline,
          type:TextDecorationType.LineThrough,
          color:Color.Red
        })
        .opacity(0.6)

      Divider()
        .strokeWidth(20)
        .color('#296')

      Text(this.poem)
        .fontColor('#04a6ee')

      Divider()
        .strokeWidth(20)
        .color('#ffe96909')

      Button('change poem')
    //   交互事件
        .onClick( ()=>{
          //把上面的文本修改别的内容
          this.poem = '劝君莫忘少年志，曾许人间第一流'
          console.log(this.poem)
        } )

      Divider()
      Button('back to index')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Constants.BGC)

  }
}


@Preview
@Component
struct Test{
  build(){
    Text('入门学习')
  }
}