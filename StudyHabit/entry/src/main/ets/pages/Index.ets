import router from '@ohos.router'
import Logger from '../common/utils/Logger'
import { Constants } from '../common/constants/Constants'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  jumpAdPage() {
    setTimeout(() => {
      router.replaceUrl({ url: 'pages/Advertising' });
    }, Constants.LAUNCHER_DELAY_TIME);
  }

  aboutToAppear() {
    this.jumpAdPage()
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.logo'))
          .width('120vp')
          .height('120vp')
      }
      .width('100%')
      .height('80%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)

      Flex({
        direction: FlexDirection.Column,
        alignItems: ItemAlign.Center,
        justifyContent: FlexAlign.Center
      }) {
        Text($r('app.string.project_name'))
          .fontSize('30vp')
          .fontColor(Color.White)

        Text($r('app.string.project_description'))
          .fontSize('16vp')
          .fontColor(Color.White)
          .margin({top: 10})
      }
      .width('100%')
      .height('20%')
    }
    .width(Constants.FULL_WIDTH)
    .height(Constants.FULL_HEIGHT)
    .backgroundColor(Constants.BG_COLOR)
  }
}