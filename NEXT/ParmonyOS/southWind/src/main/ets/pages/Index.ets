import DxinUtils from '../common/DxinUtils';
import { CateGoryItem } from '../modelData/ModelData';

@Entry
@Component
struct Index {
  // @State message: string = `南风知我意 吹梦到西洲`;
  @State title: string = `南风意`;
  // 大分类名称 数组
  categoryTag: string[] = []
  // tabBar的索引
  @State currentIndex: number = 0

  // 当前诗词poem
  @State poem:string = '帝心'

  aboutToAppear() {
    // 从全部 apiData 中获取所有大分类标题
    this.categoryTag = DxinUtils.mock2Data().map(item => item.firstTitle) as string[]
  }

  // tabBar样式
  @Builder
  tagTabBar(index: number, tagName: string) {
    Column() {
      Text(tagName)

        .fontSize(index === this.currentIndex ? 16 : 14)
        .fontColor(index === this.currentIndex ? '#ff125cdb' : '#ff565151')
    }
    .width(50)
    .height(20)
    .justifyContent(FlexAlign.Center)
    .margin({ left: 10 })
  }

  build() {
    Column({ space: 30 }) {
      Text(this.title).fontSize(30)
      Tabs() {
        ForEach(this.categoryTag, (item: string, index) => {
          TabContent() {
            Row() {
              List({ space: 10 }) {
                ForEach(DxinUtils.getItemArr(item), (item:CateGoryItem) => {
                  ListItem() {
                    Text(item.itemTitle)
                      .fontWeight(20)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#ff1050bf')
                  }
                  .width('100%')
                  .height(30)
                  .backgroundColor('#ffc6f1bc')
                  .onClick(async () => {
                    //获取当前诗词类型诗词
                    this.poem = await DxinUtils.getPoem(item.itemApi) as string
                  })
                })
              }
              .width('20%')
              .height('100%')
              .backgroundColor('#ffeadace')
              .padding({ top: 20 })
              .alignListItem(ListItemAlign.Center)
              .scrollBar(BarState.Off)
              Text(this.poem)
            }
            .width('100%')
            .layoutWeight(1)
            .backgroundColor('#fff')
          }.tabBar(this.tagTabBar(index, item))
        })
      }
      .width('100%')
      .height('60%')
      // .backgroundColor('#ffd0f871')
      .vertical(false)
      .barMode(BarMode.Scrollable)
      .onChange(index => this.currentIndex = index)


    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}