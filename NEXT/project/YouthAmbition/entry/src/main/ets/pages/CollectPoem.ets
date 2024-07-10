import { router } from '@kit.ArkUI'
import Constants from '../common/Constants'
import { CategoryPoem, Poem } from '../model/poemData'
import PoemTitle from '../view/PoemTitle'
import poemVM from '../viewModel/PoemVM'
import { JSON } from '@kit.ArkTS'

@Entry
@Component
struct CollectPoem {

  categoryPoemArr: CategoryPoem[] = [
    new CategoryPoem('山水', [
      new Poem(`劝君莫忘少年志劝君莫忘少年志劝君莫忘少年志，曾许人间第一流曾许人间第一流`, '少年志',
        '马老师','山水'),
      new Poem(`劝君莫忘少年志，曾许人间第一流`, '少年志', '马老师','山水'),
      new Poem(`劝君莫忘少年志，曾许人间第一流`, '少年志', '马老师','山水'),
      new Poem(`劝君莫忘少年志，曾许人间第一流`, '少年志', '马老师','山水'),
    ]),
    new CategoryPoem('风景', [
      new Poem('何须浅碧深红色，自是花中第一流', '桂花', '帝心','风景'),
      new Poem('何须浅碧深红色，自是花中第一流', '桂花', '帝心','风景'),
      new Poem('何须浅碧深红色，自是花中第一流', '桂花', '帝心','风景'),
      new Poem('何须浅碧深红色，自是花中第一流', '桂花', '帝心','风景'),
    ])
  ]

  // build函数构建之前执行的代码
  aboutToAppear(): void {
    // TODO CollectPoem.ets 待完成: 对categoryPoemArr 赋值目标数据
  }

  // 分组名称 自定义构建函数
  @Builder
  category(categoryName: string) {
    Text(categoryName)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(10)
  }

  // 左划 listitem 时删除效果
  @Builder
  deleteBtn(currentPoem: Poem) {
    Button({ type: ButtonType.Circle }) {
      Image($r('app.media.delete_filled'))
        .objectFit(ImageFit.Contain)
    }
    .width(40)
    .height(40)
    .margin(10)
    .backgroundColor('#eee')
    .onClick(() => {
      poemVM.deletePoem(currentPoem)
    })
  }

  build() {
    Column({ space: 30 }) {
      PoemTitle()
      List({ space: 10 }) {
        ForEach(this.categoryPoemArr, (categoryPoem: CategoryPoem, index1: number) => {
          ListItemGroup({ space: 5, header: this.category(categoryPoem.categoryName) }) {
            ForEach(categoryPoem.categoryArr, (item: Poem, index2: number) => {
              ListItem() {
                Column() {
                  Text(item.content)
                    .fontSize(20)
                    .fontColor($r('app.color.appColor2'))

                    .width(300)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.MARQUEE })
                  Row() {
                    Text(item.origin)
                    Text(item.author)
                  }
                  .width('100%')
                  .height(30)
                  // .backgroundColor('#ff2985e0')
                  .justifyContent(FlexAlign.SpaceBetween)
                }
                .height(80)
                .width('96%')
                .backgroundColor($r('app.color.appColor1'))

                .justifyContent(FlexAlign.SpaceAround)
                .borderRadius(10)
                .padding({ left: 10, right: 10 })
              }
              .swipeAction({ end: this.deleteBtn(item), edgeEffect: SwipeEdgeEffect.Spring })
            })
          }
        })


      }
      .width('100%')
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
  }
}


