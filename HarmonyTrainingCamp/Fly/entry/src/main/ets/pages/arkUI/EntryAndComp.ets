//组件是用来呈现页面的  是一个结构体  结构体中必须有一个 build 函数
// 该结构体必须被 装饰器 @Component 装饰起来
// 页面的内容，写在 build 函数中  必须有一个根容器组件。

// 入口组件
@Entry
@Component
struct EntryAndComp {
  build() {
    //   根 容器组件
    //   Column 组件： 我里面的子组件 都按照 列 的方式排列
    Column({ space: 30 }) {
      Text('日拱一卒无有尽，功不唐捐终入海')
      Text('峨眉山月半轮秋，影入平羌江水流')
    }
    // 组件的 属性方法  修饰样式
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Green)
  //   设置侧轴 方位
    .alignItems(HorizontalAlign.Center)
  //   设置主轴
    .justifyContent(FlexAlign.Start)
    .justifyContent(FlexAlign.Center)
    .justifyContent(FlexAlign.End)
    .justifyContent(FlexAlign.SpaceBetween)
    .justifyContent(FlexAlign.SpaceAround)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
@Component
struct testCom {
  build() {
    //   根 容器组件
    //   Row 组件： 我里面的子组件 都按照 行 的方式排列
    Row({ space: 20 }) {
      Text('四川无平地')
      Text('雾雨多阴天')
    }
  }
}