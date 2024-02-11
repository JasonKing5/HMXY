// 转圈特效

@Entry
@Component
struct RotateCircle {
  @State myAngle: number = 0

  onPageShow() {
    animateTo({
      duration: 100,
      iterations: -1,
      curve: Curve.Linear
    }, () => {
      this.myAngle = 360
    })
  }

  build() {
    Column() {
      Stack() {
        Row() {

        }
        .width(100)
        .height(100)
        .border({
          width: 5,
          color: {
            top: Color.Red,
            right: Color.Green,
            bottom: Color.Blue,
            left: Color.Pink,
          }
        })
        .borderRadius(50)
        .borderStyle(BorderStyle.Dashed)
        .rotate({
          z: 1,
          angle: this.myAngle
        })

        Image($r('app.media.logo'))
          .width('50%')
          .height('50%')
          .borderRadius(10)

      }
      .width(100)
      .height(100)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}