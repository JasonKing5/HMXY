@Entry
@Component
struct Index {
  @State message: string = `南风知我意 吹梦到西洲`;

  build() {
    Column({ space: 30 }) {
      Text(this.message)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}