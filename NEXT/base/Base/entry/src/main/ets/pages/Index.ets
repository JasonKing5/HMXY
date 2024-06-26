import Contants from '../common/Constants';
import RouterList from '../view/RouterList';
import TopTitle from '../view/TopTitle';

@Entry
@Component
struct Index {
  @State message: string = 'Next 语法学习';

  build() {
    Column({ space: 30 }) {
      //标题行
      TopTitle({ message: this.message,hasBack:false })
      Divider()
        .indexDividerStyle()
      // 导航列表
      RouterList({currentRouters:Contants.indexRouters})
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}

@Extend(Row)
function indexTitleRow() {
  .id('title')
  .alignRules({
    center: { anchor: '__container__', align: VerticalAlign.Top },
    middle: { anchor: '__container__', align: HorizontalAlign.Center }
  })
  .offset({
    y: 30
  })
  .width('100%')
  .justifyContent(FlexAlign.SpaceAround)
}

@Extend(Divider)
function indexDividerStyle() {
  .alignRules({
    top: { anchor: 'title', align: VerticalAlign.Bottom },
    middle: { anchor: 'title', align: HorizontalAlign.Center }
  })
  .offset({
    y: 40
  })
}

