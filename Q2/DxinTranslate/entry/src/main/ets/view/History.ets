// 用于主页的翻译界面UI封装

// 在翻页tab中已经保存成功了历史记录。在当前历史tab如何获取到呢。
// 遇到的问题：index.ets加载时，两个tab页均执行了自己的代码。此时历史tab中无历史数据。
// 即便左侧翻译tab中操作了业务，保存了。但是历史tab是一早就执行的代码

@Component
export default  struct History {


  build() {
    Column({ space: 30 }) {
     Text('历史界面')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}