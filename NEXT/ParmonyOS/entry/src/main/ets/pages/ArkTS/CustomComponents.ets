import TopTitle from '../../view/TopTitle';

@Entry
@Component
struct CustomComponents {
  @State title: string = '自定义组件';

  build() {
    Column({ space: 30 }) {
      // 顶部标题即是自定义组件
      TopTitle({ title: this.title })
      Text('此页标题即为自定义组件')
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}