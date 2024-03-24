import Constants from '../common/Constants'

@Entry
@Component
struct ArkUIList {
  @State message: string = 'list列表'
  @State arr: number[] = [0, 1]

  build() {
    Row() {
      Column({ space: 5 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Stack() {
          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Column() {
                  Text(`${item}`)
                  Image($r('app.media.logo'))
                    .width('80%')
                }
                .backgroundColor('#ffe')
              }
            })
          }
          .ListStyle()
          Button('+')
            .offset({
              x: 150,
              y: 200
            })
            .onClick(() => {
              this.arr.push(this.arr.length)
            })
        }
        .alignContent(Alignment.Center)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Constants.BGC)
  }
}

@Extend(List)
function ListStyle() {
  .alignListItem(ListItemAlign.Center)
  .listDirection(Axis.Vertical)
  .scrollBar(BarState.Auto)
  .divider({
    strokeWidth: 2,
    color: Color.Red,
    startMargin: 50,
    endMargin: 80
  })
  .onScroll((offset, state) => {
  })
}
