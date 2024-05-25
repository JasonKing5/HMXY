// 分支思路
import router from '@ohos.router'
import TopTitle from '../view/base/TopTitle'

@Entry
@Component
struct IfEl {
  message: string = router.getParams()?.['title'] || '分支-三元-类型'
  @State flag: boolean = true

  build() {
    Column({ space: 30 }) {
      TopTitle({ message: this.message })
      Divider()
      if (this.flag){
        Text('帝心')
      }else {
        Text('马园威')
      }

      Button('change Flage')
        .onClick(() => {
          this.flag = !this.flag
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))
    .justifyContent(FlexAlign.Center)
  }
}