// 装饰器学习
import router from '@ohos.router'
import TopTitle from '../view/base/TopTitle'

@Entry
@Component
struct DecoratorsStudy {
  message: string = router.getParams()?.['title'] || '状态装饰器'
  @State fatherText: string = '马园威'
  // 发布
  @Provide('love') dataSrc: string = '第一代'

  build() {
    Column({ space: 30 }) {
      TopTitle({ message: this.message })
      Divider()
      //state 状态装饰器
      Text(`父组件：${this.fatherText}`).fontSize(20)
      Button('change 父组件内容')
        .onClick(() => {
          this.fatherText = '帝心'
        })
      Divider()
      PropSon({ PropText: this.fatherText })

      Divider()
      LinkSon({ LinkText: this.fatherText })

      Divider()
      Shi8()
      Button('祖先改变')
        .onClick(() => {
          this.dataSrc = '第一代代代'
        })


    }
    .clmStyle()
  }
}

@Extend(Column)
function clmStyle() {
  .width('100%')
  .height('100%')
  .backgroundColor($r('app.color.theme_color'))
  .justifyContent(FlexAlign.Start)
}

@Component
struct PropSon {
  //  语法迭代
  @Prop PropText: string

  build() {
    Column() {
      Text(`Prop组件：${this.PropText}`).fontSize(20)
      Button('change Prop组件内容')
        .onClick(() => {
          this.PropText = '鸿蒙之父'
        })
    }
  }
}

@Component
struct LinkSon {
  //  语法迭代
  @Link LinkText: string

  build() {
    Column() {
      Text(`Link组件：${this.LinkText}`).fontSize(20)
      Button('change Link组件内容')
        .onClick(() => {
          this.LinkText = '不多先生'
        })
    }
  }
}


@Component
struct Shi8 {
 //  订阅者
 @Consume('love') data: string

  build() {
    Row() {
      Text(this.data).fontSize(30)
      Button('后代改变')
        .onClick(() => {
          this.data = '第一一一'
        })
    }
  }
}



