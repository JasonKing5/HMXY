// 弹窗的交互
@Entry
@Component
struct CustomDialogDemo2 {
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog2({
      // 点击【取消】按钮时执行
      cancel: () => {
        this.onCancel()
      },
      // 点击【确认】按钮时执行
      confirm: () => {
        this.onAccept()
      }
    })
  })

  onCancel() {
    console.info('当【取消】按钮被点击时执行业务代码')
  }

  onAccept() {
    console.info('当【确认】按钮被点击时执行业务代码')
  }

  build() {
    Column({ space: 30 }) {
      Button('click me open CustomDialog2...')
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

// 带有取消和确认按钮的弹窗
@CustomDialog
struct CustomDialog2 {
  cancel?: () => void
  confirm?: () => void
  // 定义弹窗时，该控制器 需要默认值。否则预览报错。而如果设置？表示可选，即默认null。按钮业务中调用close方法又会编译不通过
  controller: CustomDialogController = new CustomDialogController({
    builder:CustomDialog2()
  })

  build() {
    Column() {
      Text('我是CustomDialogDemo2内容').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .backgroundColor(0xffffff).fontColor(Color.Black)
          .onClick(() => {
            this.controller.close() // 关闭弹窗
            if (this.cancel) {
              this.cancel() //调用处传递
            }
          })
        Button('确认')
          .backgroundColor(0xffffff).fontColor(Color.Red)
          .onClick(() => {
            this.controller.close() // 关闭弹窗
            if (this.confirm) {
              this.confirm() //调用处传递
            }
          })
      }
    }
  }
}