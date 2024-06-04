/*
 * 组件参数构造配置:
 *    1. 无参数构造配置  Divider()
 *    2. 必选参数构造和可选参数构造  Image(src: string | PixelMap | Resource)  Text(content?: string | Resource)
 *    3. 参数可以是变量或者表达式，返回值需要满足参数类型要求
 *
 * 属性方法：
 *    1.常量参数
 *    2.内置枚举
 * 事件方法：
 *    lambda表达式（箭头函数）
 *
 * 子组件配置：
 *    容器组件内部存在子组件
 * */
@Entry
@Component
struct Grammar03 {
  count: number = 3

  build() {
    Column({ space: 10 }) {
      Text('123').fontColor(Color.Green).fontWeight(FontWeight.Bold)

      Divider()
      Image($r('app.media.Harmony_small'))
        .width(100)

      Divider()
      Image($rawfile('cloud_blue.png'))
        .width(this.count % 2 == 0 ? 100 : 200)
      Divider()
      // 行  容器组件
      Row(){
        Text('左侧文字')
        Image($rawfile('cloud_black.png')).width(100)
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      //业务代码
    })
  }
}