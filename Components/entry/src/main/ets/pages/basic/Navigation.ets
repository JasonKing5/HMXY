// src/main/ets/pages/basic/Navigation.ets
@Entry
@Component
struct NavigationExample {
  @State cIndex: number = 0
  @State bars: Array<{ text: string, subtitle: string, num: number, img: Resource, content: Resource }> = [
    {
      text: '点赞',
      subtitle: '帝心又细又长',
      num: 0,
      img: $r('app.media.navigation_0'),
      content: $r('app.media.navigation_page0')
    },
    {
      text: '投币',
      subtitle: '全网最新',
      num: 1,
      img: $r('app.media.navigation_1'),
      content: $r('app.media.navigation_page1')
    },
    {
      text: '收藏',
      subtitle: '求三连',
      num: 2,
      img: $r('app.media.navigation_2'),
      content: $r('app.media.navigation_page2')
    }
  ]
  build() {
    Column() {

      Navigation() {
        Image(this.bars[this.cIndex].content)
          .width('90%')
      }
        .title(this.NavigationTitle())
        // .subTitle('帝心又细又长')
        .hideTitleBar(false)
        .toolBar(this.NavigationToolbar())
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F1F1')
  }

  @Builder NavigationTitle() {
    Column({ space: 10 }) {
      Text(this.bars[this.cIndex].text).fontSize(26).fontColor(0x3E3E3E)
      Text(this.bars[this.cIndex].subtitle).fontSize(14).fontColor(0x3E3E3E)
    }
  }

  @Builder NavigationToolbar() {
    Row() {
      ForEach(this.bars, item => {
        Column({ space: 10 }) {
          Image(item.img).width(50).height(50)
            .border(this.cIndex === item.num ? {width: 2, color: '#aaaaaa'} : {width: 0})
          Text(item.text).fontSize(26).fontColor(
            this.cIndex === item.num ? Color.Blue : 0x3E3E3E
          )
        }
        .height(160)
        .width(130)
        .onClick(() => {
          console.log('item.num:' + item.num)
          this.cIndex = item.num
        })
      })
    }
  }
}