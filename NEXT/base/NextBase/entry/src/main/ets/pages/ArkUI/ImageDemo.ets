import { router } from '@kit.ArkUI'
import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct ImageDemo {
  title: string = (router.getParams() as Record<string, string>)?.title as string

  build() {
    Column({ space: 30 }) {
      TopTitle({ title: this.title })
      // 加载 media 资源
      Image($r('app.media.app_icon')).width('150')// 抗锯齿
        .interpolation(ImageInterpolation.Low)

      Row() {
        // 加载 rawfile 资源
        Image($rawfile('HarmonyOS.png'))
          .objectFit(ImageFit.Contain)// 保持宽高比进行缩小或者放大，使得图片完全显示在显示边界内。
          .objectFit(ImageFit.Cover)// 保持宽高比进行缩小或者放大，使得图片两边都大于或等于显示边界。
          .objectFit(ImageFit.Auto)// 自适应显示。
          .objectFit(ImageFit.Fill)// 不保持宽高比进行放大缩小，使得图片充满显示边界。
          .objectFit(ImageFit.ScaleDown)// 保持宽高比显示，图片缩小或者保持不变。
          .objectFit(ImageFit.None) // 保持原有尺寸显示。
      }
      .width(150)
      .height(150)
      .backgroundColor('#ff7aa8d6')


      // 加载 网络图片 资源  记得先申请网络权限
      Image('https://hm.codefe.cn/img/logotext3.png').width('150')
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}