// 固定的组件，在多个页面用。一行：logo和标题
//  向外暴露 export default
@Component
export default struct LogoAndTitle {
  @State message: Resource = $r('app.string.Title')
  build() {
    Row({space:40}){
      Image($r('app.media.logo'))
        .width(40)
      Text(this.message)
        .fontSize(30)
        .fontColor($r('app.color.title'))
    }
    .margin({top:5})
  }
}