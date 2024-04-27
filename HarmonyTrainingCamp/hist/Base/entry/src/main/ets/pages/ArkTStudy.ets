
@Entry
// 自定义组件
@Component
struct ArkTStudy{
 @State message:string = '河南科技学院'

  // 构建页面效果 ：有且仅有一个 根 节点
  build(){
    // 各种组件
    Column({space:30}) {

      Text(this.message).fontSize(30)
      Divider()
      Button('click')
        .width('50%')
        .onClick(() => {
          this.message = '皇家科院'
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
    .justifyContent(FlexAlign.Center)
  }
}

