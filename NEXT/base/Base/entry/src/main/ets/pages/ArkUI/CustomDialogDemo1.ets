// 弹窗入门demo1

/*
 * 1. 使用`@CustomDialog`装饰器装饰自定义弹窗。
 * 2. 在自定义弹窗内完成： 控制器+布局
 * 3. 在入口组件：控制器 + 根据业务触发弹窗
 * */
@Entry
@Component
struct CustomDialogDemo1 {
  // 入口组件 控制器
  dialogController:CustomDialogController = new CustomDialogController({
    builder:CustomDialog1()
  })

  build() {
    Column({ space: 30 }) {
      Button('click me open CustomDialog1...')
        .onClick(() => {
          this.dialogController.open()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}

// 1. 自定义弹窗 CustomDialog1  弹窗控制器中需要给出 builder，配置弹出哪个弹窗
@CustomDialog
struct CustomDialog1{
  dialogController:CustomDialogController = new CustomDialogController({
    builder:CustomDialog1()
  })
  build() {
    Column() {
      Text(`我家猫会后空翻`)
        .fontSize(20)
    }
  }
}