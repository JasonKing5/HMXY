import { Constants } from '../common/constants/Constants'

@Styles function allSize() {
  .width(Constants.FULL_WIDTH)
  .height(Constants.FULL_HEIGHT)
}

@Entry
@Component
struct Home {
  @State currentPage: number = 0;

  @Builder TabBuilder(index: number) {
    Column() {
      Text('home')
    }.justifyContent(FlexAlign.Center).allSize()
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Text('home')
      }
      .tabBar(this.TabBuilder(1))
      .align(Alignment.Start)
    }
    .allSize()
    .margin(Constants.PAGE_MARGIN)
    .padding(Constants.PAGE_PADDING)
    .barWidth('94%')
    .barMode(BarMode.Fixed)
    .onChange((index) => {
      this.currentPage = index;
    })
  }
}