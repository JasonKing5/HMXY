@Entry
@Component
struct BadgeExample {
  @State counts: number = 1 //设置消息提醒数
  @State message: string = 'new'

  build() {
    // 数字上标，maxCount默认99,超过99展示99+
    Badge({
      count: this.counts,
      maxCount: 99, //最大消息数，超过最大消息时仅显示maxCount+
      position: BadgePosition.RightTop, //设置提示点显示位置
      style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
    }) {
      Button('message')
        .onClick((event) => {
          console.log(event.screenX.toString())
          this.counts++
        })
        .width(100).height(50).backgroundColor(0x317aff)
    }
    .width(100)
    .height(50)
  }
}