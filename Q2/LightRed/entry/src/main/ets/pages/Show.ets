import LogoAndTitle from '../viewComp/LogoAndTitle'
import ShowCenter from '../viewComp/ShowCenter'

@Entry
@Component
struct PoemMain {
  build() {
    Column({ space: 30 }) {
      // 顶部
      LogoAndTitle()
      // 中心区域
      ShowCenter()
    }
    .showPageStyle()
  }
}

@Extend(Column)
function showPageStyle() {
  .width('100%')
  .height('100%')
  .backgroundColor($r('app.color.app_theme'))
}
