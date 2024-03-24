import Constants from '../common/Constants'

@Entry
@Component
struct ArkUITabs {
  @State message: string = 'tabs组件'


  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .height('20%')
        Tabs({ barPosition: BarPosition.End, index: 2 }) {
          TabContent() {
            Column() {
              Text('自定义数组')
              Text('循环遍历')
              Text('封装定义子组件')
              Text('整样式')
              Text('整不整？')
              Text('整TMD')
            }
          }.tabBar(this.barContent('微信',$rawfile('undo.svg')))

          TabContent() {
            Column() {
              Text('通讯录的内容')
            }
          }.tabBar(this.barContent('通讯录',$rawfile('done.svg')))

          TabContent() {
            Column() {
              Text('发现朋友和其他')
            }
          }.tabBar(this.barContent('发现',$rawfile('undo.svg')))

          TabContent() {
            Column() {
              Text('我服务收藏付款')
            }
          }.tabBar(this.barContent('我',$rawfile('done.svg')))
        }
        .height('80%')
        .vertical(false)

        // .scrollable(false)

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Constants.BGC)
  }

  // 自定义的布局
  @Builder
  barContent(content:string,src:Resource) {
    Column(){
      Text(content)
      Image(src).width(20)
    }
  }
}