import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct NetWorkKitHome {


  build() {
    Column({ space: 30 }) {
     TopTitle({title:'NetWorkKit'})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}