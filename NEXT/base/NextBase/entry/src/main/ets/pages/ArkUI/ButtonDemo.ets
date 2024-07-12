import { router } from '@kit.ArkUI'
import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct ButtonDemo {
  title: string = (router.getParams() as Record<string, string>)?.title as string

  build() {
    Column({ space: 30 }) {
      TopTitle({ title: this.title })
      // 默认胶囊形状。尺寸靠内容撑开。
      Button('极简按钮学习')

      Row() {
        Button('配置项按钮', { type: ButtonType.Circle })
          .width('100')
        Button('配置项按钮', { type: ButtonType.Capsule })
        Button('配置项按钮', { type: ButtonType.Normal })
      }

      // 子组件按钮 优势在于可以有多项内容，且可以布局  子组件必须只有一个根
      Button({ type: ButtonType.Normal }) {
        Row({ space: 30 }) {
          Image($r('app.media.deleted')).width(30)
          Text('删除')
        }
      }
      .borderRadius(10)
      .padding(10)
      .backgroundColor('#ffffd5d5')
      .onClick(() => {
        console.log('给按钮绑定事件函数，完成功能')
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}