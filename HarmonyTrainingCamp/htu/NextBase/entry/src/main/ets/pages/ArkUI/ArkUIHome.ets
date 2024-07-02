import TopTitle from '../../view/TopTitle'

@Entry
@Component
struct ArkUIHome {

  build() {
    Column({space:20}){
      TopTitle({title:'ArkUI'})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}