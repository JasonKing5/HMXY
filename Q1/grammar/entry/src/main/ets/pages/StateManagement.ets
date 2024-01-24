@Entry
@Component
struct StateManagement {
  // @State 必须初始化
  @State name: string = '帝心'

  build() {
    Row() {
      Column() {
        Text(this.name).StateManagement_textSty()
        Button('摸一摸').StateManagement_btnStyle(() => {
          this.name = this.name === '帝心' ? '庄生' : '帝心'
        })
        Divider()
        StateManagement_prop({ content_prop: this.name })
        Divider()
        // 撕裂感！痛！！！ bug
        // StateManagement_link({content_link : this.name})
        //   如果是state < --- > link 参数传递时，使用$变量名进行传递
        StateManagement_link({ content_link: $name })
      }
      .width('100%')
    }
    .height('100%')
  }
}

// 存放一个 @Prop 装饰的状态数据。方便父子组件之间进行数据传递和同步  State ----> prop
@Component
struct StateManagement_prop {
  @Prop content_prop: string

  build() {
    Column() {
      Text('prop:' + this.content_prop).StateManagement_textSty()
      Button('修改prop数据').StateManagement_btnStyle(() => {
        this.content_prop = 'HarmonyOS4.0'
      })
    }
  }
}

// 存放 link 数据
@Component
struct StateManagement_link {
  @Link content_link: string

  build() {
    Column() {
      Text('link:' + this.content_link).StateManagement_textSty()
      Button('修改link数据').StateManagement_btnStyle(() => {
        this.content_link = '全网最细'
      })
    }
  }
}

// 同样的样式记得复用 text
@Extend(Text) function StateManagement_textSty() {
  .fontSize(30)
  .fontWeight(FontWeight.Bold)
  .fontColor(Color.Green)
}

// button样式
@Extend(Button) function StateManagement_btnStyle(click: Function) {
  .fontSize(30)
  .onClick(() => {
    click()
  })

}







