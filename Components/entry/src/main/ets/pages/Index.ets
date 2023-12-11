@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State text: string = ''
  @State eventType: string = ''

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button("第一个按钮")
          .onKeyEvent((event: KeyEvent)=>{
            if (event.type === KeyType.Down) {
              // this .eventType =event .keyText
              this.eventType = 'Down'
            }
            if (event.type === KeyType .Up) {//this .eventType =event .keyText
              this.eventType = 'Up'
            }
            this.text = '第一个按钮:' + (event.type?"up":"down") + ' nkeyCode:' + event.keyCode + ' nkeyText:' + event
              .keyText
          })

        Button('第二个按钮')
          .onKeyEvent((event: KeyEvent) => {
            if (event.type === KeyType.Down) {
              // this .eventType =event .keyText
              this.eventType = 'Down'
            }
            if (event.type === KeyType .Up) {//this .eventType =event .keyText
              this.eventType = 'Up'
            }
            this.text = '第二个按钮:' + (event.type?"up":"down") + ' nkeyCode:' + event.keyCode + ' nkeyText:' + event
              .keyText
        })

        Text(this.text) .padding(15).fontSize(26)
    }
    .height('100%')
  }
}}