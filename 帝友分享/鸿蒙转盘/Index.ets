

import window from '@ohos.window';
import DrawModel from './DrawModel';


// Get context.
let context = getContext(this);

@Entry
@Component
struct CanvasPage {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private canvasContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State drawModel: DrawModel = new DrawModel();
  @State screenWidth: number = 0;
  @State screenHeight: number = 0;
  @State rotateDegree: number = 0;
  @State enableFlag: boolean = true;


  aboutToAppear() {
    window.getLastWindow(context)
      .then((windowClass: window.Window) => {
        let windowProperties = windowClass.getWindowProperties();
        this.screenWidth = px2vp(windowProperties.windowRect.width);
        this.screenHeight = px2vp(windowProperties.windowRect.height);
      })
      .catch((error: Error) => {
      })
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Canvas(this.canvasContext)
        .width('100%')
        .height('100%')
        .onReady(() => {
          this.drawModel.draw(this.canvasContext, this.screenWidth, this.screenHeight);
        })
        .rotate({
          x: 0,
          y: 0,
          z: 1,
          angle: this.rotateDegree,
          centerX: this.screenWidth / 2,
          centerY: this.screenHeight / 2
        })

      Image($r('app.media.btn_start'))
        .width('19.3%')
        .height('10.6%')
        .enabled(this.enableFlag)
        .onClick(() => {
          this.enableFlag = !this.enableFlag;
          this.startAnimator();
        })
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.ic_background'), ImageRepeat.NoRepeat)
    .backgroundImageSize({
      width: '100%',
      height: '38.7%'
    })
  }

  startAnimator() {
    let randomAngle = Math.round(Math.random() * 360);

    animateTo({
      duration: 4000,
      curve: Curve.Ease,
      delay: 0,
      iterations: 1,
      playMode: PlayMode.Normal,
      onFinish: () => {
        this.rotateDegree = 270 - randomAngle;
      }
    }, () => {
      this.rotateDegree = 360 * 5 +
      270 - randomAngle;
    })
  }
}