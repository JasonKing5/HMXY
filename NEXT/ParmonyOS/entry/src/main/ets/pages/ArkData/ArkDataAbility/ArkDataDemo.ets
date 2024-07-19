import TopTitle from '../../../view/TopTitle';

@Entry
@Component
struct ArkDataModel {
  @State title: string = 'ArkDataDemo';

  build() {
    Column({ space: 30 }) {
      TopTitle({ title: this.title })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}