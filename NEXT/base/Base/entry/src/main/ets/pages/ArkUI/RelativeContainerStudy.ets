import { router } from '@kit.ArkUI';
import { RouterParm } from '../../model/MyRouterInfo';

@Entry
@Component
struct RelativeContainerStudy {
  pageName: string = (router.getParams() as RouterParm)?.pageName || '页面标题'
  @State message: string = this.pageName

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('RelativeContainerStudyHelloWorld')
        .fontSize(20)
        .alignRules({
          //垂直方向 : VerticalAlign
          // 水平方向：HorizontalAlign
          // anchor 锚点 __container__ 父组件ID
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Divider()
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      // 1. 相对于父元素位置
      Row()
        .rowSty1('row1', '#ffde1111', 25)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.Start }
        })
      Row()
        .rowSty1('row2', '#ff159ec1', -25)
        .alignRules({
          //垂直方向
          center: { anchor: '__container__', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.End }
        })

      // 2: 相对于其他 其他锚点 row1 或者row2
      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .backgroundColor('#19f')
          .id('item1')
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: '__container__', align: HorizontalAlign.Center }
          })
        Row()
          .width(100)
          .height(100)
          .backgroundColor('#ff601780')
          .id('item2')
          .alignRules({
            top: { anchor: 'item1', align: VerticalAlign.Bottom },
            // left:{anchor:'item1',align:HorizontalAlign.Start},
            right: { anchor: '__container__', align: HorizontalAlign.End },
          })
      }
      .width('90%')
      .height(300)
      .border({ width: 2, color: '#ff47c397' })
      .offset({
        x: '5%',
        y: 80
      })
      .id('rc2')

      //3: 子组件锚点可以任意选择，但需注意不要相互依赖。

      Row() {
        RelativeContainer(){
          Row()
            .width(100).height(100)
            .backgroundColor('#ff3339ff')
            .id('row1')
            .alignRules({
              top:{anchor:'__container__',align:VerticalAlign.Top},
              left:{anchor:'__container__',align:HorizontalAlign.Start}
            })

          Row()
            .width(100)
            .backgroundColor('#ffd93b26')
            .id('row2')
            .alignRules({
              top: {anchor: "__container__", align: VerticalAlign.Top},
              right: {anchor: "__container__", align: HorizontalAlign.End},
              bottom: {anchor: "row1", align: VerticalAlign.Center},
            })
          Row()
            .height(100)
            .backgroundColor('#ff93c5e2')
            .id('row3')
            .alignRules({
              top: {anchor: "row1", align: VerticalAlign.Bottom},
              left: {anchor: "row1", align: HorizontalAlign.Start},
              right: {anchor: "row2", align: HorizontalAlign.Center}
            })

          Row()
            .backgroundColor('#ff8d0bc6')
            .id('row4')
            .alignRules({
              top: {anchor: "row3", align: VerticalAlign.Bottom},
              left: {anchor: "row1", align: HorizontalAlign.Center},
              right: {anchor: "row2", align: HorizontalAlign.End},
              bottom: {anchor: "__container__", align: VerticalAlign.Bottom}
              // bottom: {anchor: "row2", align: VerticalAlign.Bottom} //不符合逻辑
            })
        }

      }
      .width('90%')
      .height(300)
      .border({ width: 2, color: '#ffd615b5' })
      .alignRules({
        top: { anchor: 'rc2', align: VerticalAlign.Bottom },
        left: { anchor: 'rc2', align: HorizontalAlign.Start }
      })
      .offset({
        x: '5%',
        y: 100
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.theme_color'))

    // .height('300')
    // .width('300')
    // .border({width:3,color:'#ff16efd7'})
    // .margin(30)
  }
}


@Extend(Row)
function rowSty1(idVal: string, bgc: string, xVal: number) {
  // 1. 相对于父元素位置
  .width('50')
  .height('50')
  .backgroundColor(bgc)
  .id(idVal)
  .offset({
    x: xVal,
    y: 25
  })
}
