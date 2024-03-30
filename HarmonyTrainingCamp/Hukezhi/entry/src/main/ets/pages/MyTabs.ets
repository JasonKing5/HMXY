@Entry
@Component
struct MyTabs {
  @State message: string = 'Tabs学习'

  @Builder  tabBarView(imgUrl:Resource,content:string){
      Column(){
        Image(imgUrl)
          .width(30)
        Text(content)
      }
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .height('5%')
        Tabs() {
          TabContent() {
            Column({space:30}) {
              Text('我是微信界面')
              Text('我应该是一个列表状态')
              Text('还可以滑动')
            }
          }.tabBar(this.tabBarView($r('app.media.chat'),'微信'))

          TabContent() {
            Column({space:20}){
              Text('新的朋友')
              Text('仅聊天的朋友')
              Text('拉黑的朋友')
            }
          }.tabBar(this.tabBarView($r('app.media.chat'),'通讯录'))

          TabContent() {
            Column({space:20}){
              Text('朋友圈')
              Text('听一听')
              Text('摇一摇下线了')
            }
          }.tabBar(this.tabBarView($r('app.media.chat'),'发现'))

          TabContent() {
            Column({space:20}){
              Text('设置')
              Text('支付')
              Text('个人信息')
            }
          }.tabBar(this.tabBarView($r('app.media.chat'),'我'))
        }
        .vertical(false)
        // .scrollable(false)
        .barPosition(BarPosition.End)
        .height('95%')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}