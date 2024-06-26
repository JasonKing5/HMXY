import TopTitle from '../../view/TopTitle';

@Entry
@Component
struct NetworkKitHome {
  @State message: string = 'NetworkKit';

  build() {
    Column({ space: 30 }) {
      TopTitle({ message: this.message })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}