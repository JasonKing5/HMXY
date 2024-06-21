// 本页面用来学习text组件 : 只能写 字符串或者 资源
import router from '@ohos.router'

@Entry
@Component
struct TextDemo {
  // 字符串可以是 ''  ""  ``
  name1:string = 'HarmonyOS'

  name2:Resource = $r('app.string.title')

  build() {
    Row() {
      Column() {
        // 1: 可以写死一个字符串。
        Text('学习text组件')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            router.back()
          })
        Divider()
      // 2.1： 可以读取字符串变量 需要使用 this.  调用
        Text(this.name1)
          .fontSize(30)
      // 2.2 可以读取资源变量 需要使用 this.  调用
        Text(this.name2)
          .fontSize(30)

        // 错误示范。
        // Text(123)

        // 重点应该是文本的样式
        Text('属性方法')
          .width(60)
          // .height(50)
          .fontSize(20)
          .fontColor(Color.Orange)
          .backgroundColor('#ff3c97f1')
          // .textAlign(TextAlign.Center)
          .textAlign(TextAlign.End)
          .maxLines(1)
          .textOverflow({
            // overflow:TextOverflow.Clip
            overflow:TextOverflow.Ellipsis
            // overflow:TextOverflow.None
          })
          .decoration({
            type:TextDecorationType.LineThrough,
            color:'red'
          })

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}