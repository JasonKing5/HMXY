@Entry
@Component
struct ZhuangShiQi {
  // 变量数据改变将会驱动build函数重新渲染
  @State message: string = '装饰器学习'
  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Divider()

        Button('修改message')
          .onClick(() => {
              this.message = '数据驱动UI更新'
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct CustomItem {
  @State message: string = '自定义组件'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}


@Component
struct CustomItem1 {
  @State message: string = '自定义组件1'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}