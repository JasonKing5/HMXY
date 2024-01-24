import router from '@ohos.router';
import { Constants } from '../common/constants/Constants'
@Entry
@Component
struct Advertising {
  @State duration: number = Constants.AD_DURATION;
  @State intervalId: number = -1;

  goToHomePage() {
    clearInterval(this.intervalId);
    router.replaceUrl({ url: 'pages/Home' });
  }

  aboutToAppear() {
    this.intervalId = setInterval(() => {
      if (this.duration > 0) {
        this.duration -= 1;
      } else {
        this.goToHomePage();
      }
    }, Constants.DURATION_1000)
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.jump_ad', this.duration))
          .height('36vp')
          .margin({ top: '36vp'})
          .padding('8vp')
          .fontSize('12vp')
          .fontColor(Color.White)
          .letterSpacing(Constants.LETTER_1)
          .border({ color: Color.White, width: '1vp'})
          .borderRadius('16vp')
          .backgroundColor('rgba(0,0,0,0.20)')
          .onClick(() => this.goToHomePage())
      }
      .width('90%')
      .justifyContent(FlexAlign.End)

      Row() {
        Image($r('app.media.logo'))
          .width('56vp')
          .height('56vp')
          .objectFit(ImageFit.Contain)

        Column() {
          Text($r('app.string.project_name'))
            .fontSize('26vp')
            .fontColor('#182431')
            .fontFamily($r('app.string.HarmonyHeiTi_Bold'))
            .fontWeight(Constants.FONT_WEIGHT_700)
            .letterSpacing(Constants.LETTER_1)
          Text($r('app.string.project_label'))
            .fontFamily($r('app.string.HarmonyHeiTi'))
            .fontColor('#182431')
            .fontWeight(400)
            .letterSpacing(1.4)
            .opacity(0.4)
            .fontSize('16vp')
        }
        .margin({ left: '12vp'})
        .alignItems(HorizontalAlign.Start)

      }
      .width(Constants.FULL_WIDTH)
      .height('100vp')
      .justifyContent(FlexAlign.Center)
    }
    .width(Constants.FULL_WIDTH)
    .height(Constants.FULL_HEIGHT)
    .backgroundImage($r('app.media.ic_ad_bg'))
    .backgroundImageSize({ width: Constants.FULL_WIDTH, height: Constants.FULL_HEIGHT })
    .backgroundImagePosition({ x: 0, y: 0 })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}