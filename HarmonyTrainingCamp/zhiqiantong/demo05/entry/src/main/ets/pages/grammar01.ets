/*
 * ArkTS基本组成
 *  装饰器--自定义组件--UI描述-- 内置组件--属性方法--事件方法
 * */
@Entry
@Component
struct Hello {
  @State message:string = 'world'
  // build函数内部必须有一个根容器组件
  build(){
   Column(){
     Text('Hellow').fontSize(50)
     Text(this.message).fontSize(50).fontColor(Color.Green)
     Divider()
     Button(){
       Text('click me')
     }
     .width(100)
     .height('30')
     .margin({
       top:10
     })
     .onClick(()=>{
       // 让world 变成
      this.message = 'ArkTS'
     })
     Divider()
     // test1()
   }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)

  }
}

@Component
struct  test1{
  build(){
    Column(){
      Text('123').fontSize(50)
      Text('456').fontSize(50)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

