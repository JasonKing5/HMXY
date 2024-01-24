// common/Click.ets
@Entry
@Component
struct ClickExample {
  @State text: string = ''

  build() {
    Column() {
      Row({ space: 20 }) {
        Button('Click', {type: ButtonType.Normal}).width(100).height(50)
          .onClick((event: ClickEvent) => {
            this.text = 'Click Point:' + '\n  screenX:' + event.screenX + '\n  screenY:' + event.screenY
            + '\n  x:' + event.x + '\n  y:' + event.y + '\ntarget:' + '\n  width:'
            + event.target.area.width + '\n  height:' + event.target.area.height + '\ntimestamp' + event.timestamp;
          })
        Button('Click', {type: ButtonType.Normal}).width(200).height(50)
          .onClick((event: ClickEvent) => {
            this.text = 'Click Point:' + '\n  screenX:' + event.screenX + '\n  screenY:' + event.screenY
            + '\n  x:' + event.x + '\n  y:' + event.y + '\ntarget:' + '\n  width:'
            + event.target.area.width + '\n  height:' + event.target.area.height + '\ntimestamp' + event.timestamp;
          }).margin({top: 20})
      }.margin(0)

      Text(this.text).margin(15).fontSize(26)
    }.width('100%').alignItems(HorizontalAlign.Start)
  }
}