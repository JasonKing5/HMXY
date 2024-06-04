/*
 * 动态构建UI装饰器
 *    1. @Builder  封装布局内容
 *    2. @Extend   指定组件属性
 *    3. @style    通用属性
 *        写在结构体外面，需要关键字function  写在结构体内部。不需要function
 *        如果结构体内部已经存在了该函数（同名），优先调用结构体内部的函数。
 *    4. @CustomDialog  弹窗
 * */
@Entry
@Component
struct Grammar05 {

  // 定义所有基础组件的通用属性方法
  @Styles globalStyle(){
    .width('200')
    .height('50')
    .backgroundColor('green')
  }
  @Builder text_img(content:string,name:string){
    Row({ space: 10 }) {
      Text(content)
      Image($rawfile(name)).width(100)
    }

  }
  build() {
    Column() {
      this.text_img('图片1','cloud_blue.png')
      this.text_img('图片2','cloud_black.png')
      Divider()
      Text('Hello ArkTS').textStyle(30,'red')
      Text('Hello HarmonyOS').textStyle(40,'green')
      Text('Hello malaoshi').textStyle(30,'gray')
      Divider()
      Button('通用属性-button').globalStyle()
      Text('通用属性-text').globalStyle()
    }
    .width('100%')
    .height('100%')
  }
}


@Extend(Text) function textStyle(size:number,color:string){
  .fontSize(size)
  .fontColor(color)
  .fontStyle(FontStyle.Italic)
}

/*
 *  @Styles修饰的函数不能有参数 封装的都是通用的属性方法
 * */
@Styles function globalStyle(){
  .width('200')
  .height('50')
  .backgroundColor('gray')
}



