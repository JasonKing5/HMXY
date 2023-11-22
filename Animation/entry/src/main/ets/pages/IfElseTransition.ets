// 使用if...else..控制组件的插入与删除产生动画
// transition:必须配合animateTo
@Entry
@Component
struct IfElseTransition {
  // 姜淼全责
  @State flag: boolean = true

  build() {
    Column() {
      Button(this.flag ?  '隐藏' : '显示').fontSize(30).margin(30).width(150).height(50)
        .onClick(() => {
          animateTo({}, () => {
            this.flag = !this.flag
          })

        })
      if (this.flag) {
        Image($r('app.media.harmonyOS4')).width(300)
          // .transition({
          //   type:TransitionType.All,
          //   opacity:1
          // })
          .transition({
            type:TransitionType.Insert,
            translate:{x:200,y:-200},
            opacity:0,
            rotate:{angle:360}
          })
          .transition({
            type:TransitionType.Delete,
            translate:{x:200,y:-200},
            opacity:0,
            rotate:{angle:360}
          })
      }

    }.height('100%').width('100%')
  }
}