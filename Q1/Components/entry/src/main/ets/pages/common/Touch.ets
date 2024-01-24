// common/Touch.ets
@Entry
@Component
struct TouchExample {
  @State text: string = ''
  @State eventType: string = ''

  build() {
    Column() {
      Button('Touch').height(40).width(100)
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.eventType = 'Down'
          }
          if (event.type === TouchType.Up) {
            this.eventType = 'Up'
          }
          if (event.type === TouchType.Move) {
            this.eventType = 'Move'
          }
          this.text = 'TouchType:' + this.eventType + '\nx: '
          + event.touches[0].x + '\n' + 'y: ' + event.touches[0].y + '\nwidth:'
          + event.target.area.width + '\nheight:' + event.target.area.height
        })
      Button('Touch').height(50).width(200).margin(20)
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.eventType = 'Down'
          }
          if (event.type === TouchType.Up) {
            this.eventType = 'Up'
          }
          if (event.type === TouchType.Move) {
            this.eventType = 'Move'
          }
          this.text = 'TouchType:' + this.eventType + '\nx: '
          + event.touches[0].x + '\n' + 'y: ' + event.touches[0].y + '\nwidth:'
          + event.target.area.width + '\nheight:' + event.target.area.height
        })
      Text(this.text).fontSize(26)
    }.width('100%').padding(30)
  }
}