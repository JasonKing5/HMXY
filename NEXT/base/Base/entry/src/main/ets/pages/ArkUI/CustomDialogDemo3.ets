// 弹窗的动画
@Entry
@Component
struct CustomDialogDemo3 {
  @State textValue: string = ''
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialog3(),
    // 弹窗动画效果
    openAnimation: {
      duration: 1200,
      curve: Curve.Friction,
      delay: 500,
      playMode: PlayMode.Alternate,
      onFinish: () => {
        console.info('play end')
      }
    },
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    // 弹窗位置
    offset: { dx: 0, dy: -50 },
    // 弹窗的尺寸
    gridCount: 4,
    customStyle: false,
    backgroundColor: 0xd9ffffff,
    cornerRadius: 10,
  })

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = null // 将dialogController置空
  }

  build() {
    Column({ space: 30 }) {
      Button(`弹窗动画效果`)
        .backgroundColor('#bb2b2b')
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}

@CustomDialog
struct CustomDialog3 {
  controller?: CustomDialogController

  build() {
    Column() {
      Text('Whether to change a text?').fontSize(16).margin({ bottom: 10 })
    }
  }
}