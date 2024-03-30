@Entry
@Component
struct MyTabs {
  @State message: string = 'Tabs学习'
  chatArr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

  @Builder
  tabBarView(imgUrl: Resource, content: string) {
    Column() {
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
            List({initialIndex:3}) {
              ForEach(this.chatArr, (item: number, index: number) => {
                ListItem() {
                  Row() {
                    Image($r('app.media.chat')).width(40)
                    Column() {
                      Text('鸿蒙直播群'+item).fontWeight(FontWeight.Bold)
                      Text('IT董宇辉').opacity(.5)
                    }
                  }
                  .chatListRow()
                }
              })
            }
          }.tabBar(this.tabBarView($r('app.media.chat'), '微信'))

          TabContent() {
            Column({ space: 20 }) {
              Row() {
                Image($r('app.media.chat')).width(30)
              }

            }
          }.tabBar(this.tabBarView($r('app.media.chat'), '通讯录'))

          TabContent() {
            Column({ space: 20 }) {
              Text('朋友圈')
              Text('听一听')
              Text('摇一摇下线了')
            }
          }.tabBar(this.tabBarView($r('app.media.chat'), '发现'))

          TabContent() {
            Column({ space: 20 }) {
              Text('设置')
              Text('支付')
              Text('个人信息')
            }
          }.tabBar(this.tabBarView($r('app.media.chat'), '我'))
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

@Extend(Row)
function chatListRow() {
  .width('100%')
  .height(80)
  .backgroundColor(Color.Gray)
  .border({
    width: 2,
    color: Color.Pink
  })
  .padding({ left: 5 })
}
