/*
 * todo:本套教程QQ交流群：324702418
 * todo: 代码在线地址：https://gitee.com/mayuanwei
 * todo: 自定义组件创建何使用
 * todo: Mr. Chen 陈(背景图)
 * */

/*
 * 1: 组件必须使用@Component装饰
 * 2:@Entry 装饰哪个组件，哪个就呈现在页面上，。
 * 3： 被@Entry 装饰的入口组件。 build() 中必须有且仅有一个根**容器**组件
 *    其他的自定义组件，build() 中必须有且仅有一个根组件
 * */

@Entry
@Component
struct CustomComponents {
  @State message: string = '诗词学习'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        itemComponent()
        itemComponent({ content: '二十四桥明月夜，玉人何处教吹箫？' })
        itemComponent({ content: '荷尽已无擎雨盖，菊残犹有傲霜枝。' })
        itemComponent({ content: '一年好景君须记，最是橙黄橘绿时。' })
      }
      .width('100%')
    }
    .height('100%')
  }
}


@Component
struct itemComponent {
  // 自定义组件可以使用变量(都是私有化的) 传递参数
  content: string = '青山隐隐水迢迢，秋尽江南草未凋。'
  // 哪种情况可以驱动UI更新。@state
  @State isDone: boolean = false



  build() {
    //   必须有一个根组件。
    Row() {
      Image(this.isDone ? $r('app.media.todo_ok') : $r('app.media.todo_default'))
        .width(20)
        .height(20)
        .margin(15)
      Text(this.content)
        .decoration({ type: this.isDone ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .backgroundColor(Color.Pink)
    .borderRadius(25)
    .margin({
      top: 15
    })
    .onClick(() => {
      this.isDone = !this.isDone
    })
  }
}


