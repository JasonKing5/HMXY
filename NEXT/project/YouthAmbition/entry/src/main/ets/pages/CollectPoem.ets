import { Category, Poem } from '../model/poemData'
import PoemTitle from '../view/PoemTitle'
import poemVM from '../viewModel/PoemVM'


let cuttrenPoemState = LocalStorage.getShared()

@Entry(cuttrenPoemState)
@Component
struct CollectPoem {

  @LocalStorageLink('isCollectCuttentPoem') isCollect :boolean = false


 @State categoryList: Category[] = []

  // build函数构建之前执行的代码
  aboutToAppear(): void {
    this.categoryList = poemVM.getCategoryPoemList()
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
  deleteBtn(categoryList:Category[],categoryTitle:string,currentPoem: Poem) {
    Button({ type: ButtonType.Circle }) {
      Image($r('app.media.delete_filled'))
        .objectFit(ImageFit.Contain)
    }
    .width(40)
    .height(40)
    .margin(10)
    .backgroundColor('#eee')
    .onClick(() => {
      // 修改 MianPoem中的变量联动。 其实修改的是页面级的 localStorage 的变量 
      // 别直接删  要取消收藏的 currentPoem  和 主体界面的 当前显示的 poem 是否为同一个诗句。如果是，设置收藏滑块的状态为false，。
      let currentShowPoem:Poem = AppStorage.get('currentShowPoem') as Poem
      if (currentPoem.content === currentShowPoem.content) {
        this.isCollect = false
      }else{
        // 如果不是的话  调用删除方法。取消收藏这句诗词
        poemVM.deletePoem(categoryList,categoryTitle,currentPoem)
      }
    })
  }

  build() {
    Column({ space: 30 }) {
      PoemTitle()
      List({ space: 10 }) {
        ForEach(this.categoryList, (categoryPoem: Category, index1: number) => {
          ListItemGroup({ space: 5, header: this.category(categoryPoem.categoryName) }) {
            ForEach(categoryPoem.categoryPoem, (item: Poem, index2: number) => {
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
              .swipeAction({ end: this.deleteBtn(this.categoryList,categoryPoem.categoryName,item), edgeEffect: SwipeEdgeEffect.Spring })
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


