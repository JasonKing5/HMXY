import { router } from '@kit.ArkUI'
import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct RowColumn {
  title: string = (router.getParams() as Record<string, string>)?.title as string
  build() {
    Column({ space: 30 }) {
      TopTitle({ title: this.title })
      // row 组件 按行布局
      Row(){
        Image($r('app.media.create')).width(40)
        Button('行内btn')
        Text('行内文本')
      }
      .width('100%')
      .height('40%')
      .backgroundColor('#ffc6d9ea')
      .justifyContent(FlexAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Top)
      .alignItems(VerticalAlign.Bottom)
      .backgroundImage($rawfile('HarmonyOS.png'))
      .backgroundImageSize({
        width:'100%',
        height:'100%'
      })

      // column 按列布局
      Column(){
        Row(){
          Image($r('app.media.create')).width(40)
          Blank()
          Text('内容撑开')
        }
        .width('100%')
        .height('50%')
        .backgroundColor('#aaa')
        .padding(20)
        .layoutWeight(4)  // 权重分配会盖过原本尺寸

        Image($r('app.media.create')).width(40)
          .layoutWeight(1)
        Button('行内btn')
          .layoutWeight(1)
        Text('行内文本')
          .layoutWeight(1)
      }
      .width('100%')
      .height('40%')
      .backgroundColor('#ffc9f1d3')
      .justifyContent(FlexAlign.SpaceEvenly)
      .alignItems(HorizontalAlign.End)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}