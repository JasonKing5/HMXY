//@Builder装饰器：自定义构建函数
import TopTitle from '../../view/TopTitle';

@Entry
@Component
struct BuilderDecorators {
  @State title: string = '@Builder装饰器';

  // 局部 UI自定义构建函数
  @Builder
  myBuilderFun(){
    Row(){
      Button('左青龙')
      Text(this.title)
      Button('右白虎')
    }
    .width('90%')
    .height(20)
    .backgroundColor('#999')
    .justifyContent(FlexAlign.SpaceBetween)
  }
  build() {
    Column({ space: 30 }) {
      TopTitle({ title: this.title })
      Text('自定义构建函数：在本页面中进行UI服用。不涉及数据和状态。包含全局和局部')
      Text('自定义构建函数：通过this.访问当前组件的变量而非传参')
      Divider()
      Text('调用组件内部自定义构建函数  并使用组件状态变量')
      this.myBuilderFun()

      Divider()
      Text('调用全局自定义构建函数，参数：传递组件变量')
      myGlobalBuilderFun(this.title)

      Text('参数传递有诸多细节，参考官方文档')
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.theme_color'))

  }
}


// 局部 UI自定义构建函数
@Builder
function  myGlobalBuilderFun(title:string) {
  Row() {
    Button('左')
    Text(title)
    Button('右')

  }
  .width('90%')
  .height(20)
  .backgroundColor('#999')
  .justifyContent(FlexAlign.SpaceBetween)
}