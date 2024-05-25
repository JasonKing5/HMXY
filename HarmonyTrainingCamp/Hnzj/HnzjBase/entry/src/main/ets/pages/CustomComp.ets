import router from '@ohos.router'
import TopTitle from '../view/base/TopTitle'

@Entry
@Component
struct CustomComp {
   message: string = router.getParams()?.['title'] || '自定义组件'

  build() {
    Column({ space: 30 }) {
      //调用一个组件产生效果跟刚才一样一样的
      TopTitle({message:this.message})
      Divider()
      Text('当前页面布局内容')
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}


