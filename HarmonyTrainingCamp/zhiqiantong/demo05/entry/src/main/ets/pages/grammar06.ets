/*
 * 弹窗效果
 * @CustomDialog 组件必须有一个属性CustomDialogController
 *
 * */
@Entry
@Component
struct Grammar06 {
  // 自定义弹窗组件的显示与关闭，需要控制器来控制
  dialogController:CustomDialogController = new CustomDialogController({
    builder:dialogExample(),
    autoCancel:true //点击弹窗之外的空白部分，关闭弹窗
  })
  build() {
    Column() {
      Button('click to open dialog')
        .onClick(()=>{
           this.dialogController.open()
        })
    }.width('100%')
    .height('100%')
  }
}
// 自定义弹窗组件
@CustomDialog
struct dialogExample{
  controller:CustomDialogController
  build(){
    Column(){
      Text('这是消息提示框')
      Button('close....')
        .onClick(()=>{
           this.controller.close()
        })
    }
  }
}
