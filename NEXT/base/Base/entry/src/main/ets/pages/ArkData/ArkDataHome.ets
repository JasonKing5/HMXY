import TopTitle from '../../view/TopTitle';

@Entry
@Component
struct ArkDataHome {
  @State message: string = '数据存储';

  build() {
    Column({ space: 30 }) {
      TopTitle({ message: this.message })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}