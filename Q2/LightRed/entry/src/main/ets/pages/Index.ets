import router from '@ohos.router'
import LogoAndTitle from '../viewComp/LogoAndTitle'

@Entry
@Component
struct Index {
  // 生命周期函数
  aboutToAppear(){
  //   单次定时器
    setTimeout(() => {
      // 开屏界面不会再跳转回来。没必要保存路由到栈内存。栈内存最多有32个路由。
      router.replaceUrl({
        url: "pages/PoemMain"
      })
    },3000)
  }

  build() {
    Column({space:40}) {
      Image($rawfile('loading.jpg'))
        .height('75%')

      LogoAndTitle()

      Text($r('app.string.Name_from'))
        .fontColor($r('app.color.title'))

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_theme'))
  }
}