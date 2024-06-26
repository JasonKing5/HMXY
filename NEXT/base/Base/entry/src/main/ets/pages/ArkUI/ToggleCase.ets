// Toggle用于切换蓝牙开关状态。
@Entry
@Component
struct ToggleCase {
  @State BluetoothState: string = 'off';

  build() {
    Column({ space: 30 }) {
      Text("Bluetooth Mode")
        .height(50)
        .fontSize(30)
      Row() {
        Text("Bluetooth")
          .fontSize(16)
        Toggle({ type: ToggleType.Switch })
          .width(50)
          .onChange((isOn: boolean) => {
            this.BluetoothState = isOn ? ' on' : ' off'
          })
      }
      .width('90%')
      .height(50)
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({
        left:10,
        right:20
      })
      .backgroundColor(0xFFFFFF)

      Text() {
        Span('bluetooth is ')
          .font({ size: 30, weight: 700 })
        Span(this.BluetoothState)
          .font({ size: 30, weight: 700 })
          .fontColor('#bb2b2b')
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}