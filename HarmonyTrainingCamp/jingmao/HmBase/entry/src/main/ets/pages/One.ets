import router from '@ohos.router'

@Entry
@Component
struct One {
  build() {
    Column() {
      // 组件
      Text('哥们是第一个页面')
        //     属性方法
        .fontSize(30)
      //   事件函数方法
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe8eeee')
    .onClick(() => {
      router.pushUrl({
        url:"pages/Two"
      })
    })
  }
}