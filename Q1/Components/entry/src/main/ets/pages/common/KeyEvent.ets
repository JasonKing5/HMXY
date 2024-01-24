// common/KeyEvent.ets
@Entry
@Component
struct KeyEventExample {
  @State text: string = ''
  @State eventType: string = ''

  build() {
    Column() {
      Button('KeyEvent')
        .onKeyEvent((event: KeyEvent) => {
          if (event.type === KeyType.Down) {
            this.eventType = 'Down'
          }
          if (event.type === KeyType.Up) {
            this.eventType = 'Up'
          }
          this.text = 'KeyType:' + this.eventType + '\nkeyCode:' + event.keyCode + '\nkeyText:' + event.keyText
        })
      Text(this.text).padding(15).fontSize(26)
    }.height(300).width('100%').padding(35)
  }
}