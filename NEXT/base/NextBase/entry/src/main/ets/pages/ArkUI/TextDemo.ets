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
        Text('常用属性font')
          .font({weight:FontWeight.Bold,size:20,style:FontStyle.Italic,family:'HarmonyOS Sans'})
        Text('decoration装饰线'){
          Span('decoration1').decoration({type:TextDecorationType.Underline,color: '#ffe00f48' })
          Span('decoration2').decoration({type:TextDecorationType.LineThrough,style:TextDecorationStyle.DASHED})
          Span('decoration3').decoration({type:TextDecorationType.Overline,style:TextDecorationStyle.WAVY})
        }

        Text('字母大小'){
          Span('harmonyos').fontColor('#fff66868').textCase(TextCase.UpperCase)
          Span('HARMONY').fontColor('#ff209898').textCase(TextCase.LowerCase)
          Span('HarmonyOS').fontColor('#ffe7b805').textCase(TextCase.Normal)
        }

        Text('对齐方式love text')
          .fontSize(30)
          .width(200)
          .height(40)
          .backgroundColor('#aaa')
          .textAlign(TextAlign.Center)
          .textAlign(TextAlign.End)
          .textAlign(TextAlign.JUSTIFY)
          .wordBreak(WordBreak.NORMAL)  // 默认效果 会认识单词。让单词当作整体
          .wordBreak(WordBreak.BREAK_ALL) // 正常塞满，直到阶段
          .wordBreak(WordBreak.BREAK_WORD) // 按照单词进行超出阶段

        Text('超长文本阶段效果演示textOverflow属性使用')
          .margin({top:30})
          .width('50%')
          .wordBreak(WordBreak.BREAK_ALL)
          .backgroundColor('#ffeeb6b6')
          //最大行 配合使用
          .maxLines(1)
          // .textOverflow({overflow:TextOverflow.None})
          // .textOverflow({overflow:TextOverflow.Clip})
          // .textOverflow({overflow:TextOverflow.Ellipsis})  // 省略号
          .textOverflow({overflow:TextOverflow.MARQUEE})  // 跑马灯

        Text('基线偏移量baselineOffset')
          .baselineOffset(30)
        // 其实文字是有基线的。
        //  正数：我自己要向上位移。位移出来的空间（我下面的空间）。就是我占用的了。
        //  负数：我自己要向下位移。位移出来的空间（我上面的空间）。就是我占用的了。
        Text('测试偏移量')

        Text('文本字符间距letterSpacing')
          .letterSpacing(3)
        Text('是否可复制copyOption')
          .copyOption(CopyOptions.None)
          .copyOption(CopyOptions.InApp)    // 在应用中进行复制
          .copyOption(CopyOptions.LocalDevice)  // 在设备内的过应用中进行复制粘贴
          .onCopy((value:string) => {
            console.log('@@@进行了复制。。。' + value)
          })
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}