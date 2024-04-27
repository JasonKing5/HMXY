// 待办事项案例
@Entry
@Component
struct TodoList {
  @State title: string = '电竞选手'

  LolUser:string []=[
    'thyshe',
    'UZI',
    'faker',
    'jacklove'
  ]

  build() {
    Column({ space: 30 }) {
      myTitle({ tt: this.title })
      ForEach(this.LolUser, (item: string, index: number) => {
        myRow({ name: item })
      })
    }
    .bjStyle()
  }
}



@Component
struct myRow {
  name:string = 'pdd'
  build() {
    Row({ space: 20 }) {
      Image($r('app.media.done'))
        .width(30)
        .height(30)
      Text(this.name)
    }
    .rowStyle()
  }
}

@Component
struct myTitle {
  tt :string = '默认值'

  build() {
    Column({space:30}){
      Text(this.tt)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .fontSize(30)

      Divider()
    }
  }
}


@Extend(Column)
function bjStyle() {
  .width('100%')
  .height('100%')
  .backgroundColor($r('app.color.app_theme'))
  .justifyContent(FlexAlign.Center)
}

@Extend(Row)
function rowStyle() {
  .width('90%')
  .height(50)
  .backgroundColor('#fff6b5b5')
  .padding({
    left: 15
  })
  .borderRadius(25)
}
