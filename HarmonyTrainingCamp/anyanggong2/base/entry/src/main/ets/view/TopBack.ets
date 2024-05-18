// 自己封装了一个自定义的组件。可以呈现一个自定义的布局效果。别的地方到处使用
import router from '@ohos.router'

@Component
export default  struct TopBack {
  build() {
    Row(){
      Image($r('app.media.back'))
        .width(50)
      Text('返回上一页')
    }
    .width('80%')
    .height(80)
    // .backgroundColor('#ffcb2121')
    .justifyContent(FlexAlign.SpaceBetween)
    .onClick(() => {
      router.back()
    })
  }
}