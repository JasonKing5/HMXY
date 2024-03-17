// ets  extends  arkts语言
@Entry
@Component
struct Variable {
  age: number = -20.89
  name: string = '鸿蒙之父：帝心'
  poem: string = '峨眉山月半轮秋，影入平羌江水流'
  flag1: boolean = true
  flag2: boolean = false
  arr: Array<string> = ['HarmonyOS', 'arkts', "api9", `帝心`]
  fn1() {
    console.log('业务代码')
  }
  fun2 = ()=>{
    //业务代码
  }
  build() {
    Column() {
      Image($r('app.media.lyf'))
        .width(200)
      Divider()
      Text(this.name).fontSize(30).fontColor(Color.Gray)
      /*
       * 1： 如何声明变量并在组件中使用
       * 2:  如何查看组件使用方式：官方文档+认真听课
       * 3： 遍历数组数据
       *  todo : 自己定义一个字符串数组。。遍历显示
       * */
      ForEach(this.arr, (item:string,index:number) => {
        Text(item).fontSize(30).fontColor(Color.Brown)
      })

      Divider()
      // this.flag1 为true 则显示，否则不显示
      if (this.flag1){
        Text(this.poem)
      }else{
        Text('test if else...')
      }





    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}
