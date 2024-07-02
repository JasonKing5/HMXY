// Text组件重点知识。
import { font, router } from '@kit.ArkUI'
import TopTitle from '../../view/TopTitle'
import { JSON } from '@kit.ArkTS'

@Entry
@Component
struct TextDemo {
  title: string = (router.getParams() as Record<string, string>)?.title as string

  // 系统风格字体列表
  @State sysFontList:string[]  = ['宋体','楷体']

  build() {
    Column({ space: 20 }) {
      TopTitle({ title: this.title })
      Column(){
        Text('接口参数可以是字符串或者资源类型')
        Text($r('app.string.app_name'))
      }
      Column(){
        Text('子组件 span:文本')
        Text('子组件 ImageSpan:行内图片')
        Text('子组件 SymbolSpan:系统内置预置图片资源icon')
        Text('子组件 ContainerSpan:用于统一管理多个Span、ImageSpan的背景色及圆角弧度')
        Text('子组件'){
          Span('span')
          // ImageSpan 行内图片
          ImageSpan($r('app.media.create'))
            .width(30)
            .height(30)
            .backgroundColor('red')
            .textBackgroundStyle({color:'#ff0e77e7'})

          SymbolSpan($r('sys.symbol.wifi'))
          ContainerSpan(){
            ImageSpan($r('app.media.app_icon'))
              .width(40).height(40)
              .verticalAlign(ImageSpanAlignment.CENTER)
            Span('Span1')
              .fontSize(20)
            Span('Span2')
              .fontSize(22)
          }
          .textBackgroundStyle({color:'#eee',radius:5})
        }
        .width('100%')
        .height(60)
        .backgroundColor('#ffdea6a6')
        .textAlign(TextAlign.Center)
      }

      Column(){
        Text('系统字体')
          .font({weight:FontWeight.Bold,size:20,style:FontStyle.Italic,family:'HarmonyOS Sans'})
        Button('获取系统字体列表,预览器不行，模拟器为空，需要真机')
          .onClick(() => {
            console.log('click')
            this.sysFontList= font.getSystemFontList()
            console.log(`sys....${JSON.stringify(this.sysFontList)}`)
          })
        ForEach(this.sysFontList, (item:string) => {
          Text(item)
        })
      }
      Column(){
        Text('常用属性')
          .font({weight:FontWeight.Bold,size:20,style:FontStyle.Italic,family:'HarmonyOS Sans'})
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}