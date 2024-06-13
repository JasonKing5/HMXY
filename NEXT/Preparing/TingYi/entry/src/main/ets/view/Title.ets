@Component
export default  struct Title {
  build() {
    Text($r('app.string.EntryAbility_label'))
      .fontSize(30)
      .fontColor('#ffde07ac')
  }
}