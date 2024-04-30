// 待办事项案例
@Entry
@Component
struct TodoList {
  @State title: string = '电竞选手'
  LolUser: string [] = []

  aboutToAppear(){

    this.LolUser = ['thyshe', 'UZI', 'faker', 'jacklove']
  }

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
  name: string = 'pdd'
  @State flag: boolean = true

  build() {
    Row({ space: 20 }) {
      Image( this.flag  ? $r('app.media.done') : $r('app.media.undo') )
        .width(30)
        .height(30)

      Text(this.name)
        .opacity(this.flag ? .5 : 1)
        .decoration({
          type: this.flag ? TextDecorationType.LineThrough : TextDecorationType.None
        })
        .fontColor(this.flag ? Color.Red : Color.Green)
    }
    .rowStyle(this.flag)
    .onClick(() => {
      this.flag = !this.flag
    })
  }
}

@Extend(Row)
function rowStyle(flag:boolean) {
  .width('90%')
  .height(50)
  .backgroundColor( flag ? '#fff6b5b5' : '#fff')
  .padding({
    left: 15
  })
  .borderRadius(25)
}


@Component
struct myTitle {
  tt: string = '默认值'

  build() {
    Column({ space: 30 }) {
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


