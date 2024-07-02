import TopTitle from '../../view/TopTitle'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct ArkDataHome {
  title: string = (router.getParams() as Record<string, string>)?.title as string
  build() {
    Column({ space: 30 }) {
      TopTitle({title:this.title})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}