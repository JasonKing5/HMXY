/*
 * 状态管理 : @Link
 *
 * @State <---> @Link
 * */
@Entry
@Component
struct Grammar09 {
  @State isHappy :boolean = false

  build() {
    Column({ space: 20 }) {
      Grammar09_son({happy: $isHappy})

      Divider()
      Text( this.isHappy ? '快乐' : '悲伤' ).fontSize(30)
      Button('父组件修改数据状态').onClick((event: ClickEvent) => {
        this.isHappy = !this.isHappy
      })
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct Grammar09_son {
  @Link happy:boolean

  build() {
    Column() {
      Image(this.happy ? $r('app.media.smile') : $r('app.media.cry') )
        .width(100)
      Button('子组件修改数据状态').onClick((event: ClickEvent) => {
        this.happy = !this.happy
      })
    }
  }
}

