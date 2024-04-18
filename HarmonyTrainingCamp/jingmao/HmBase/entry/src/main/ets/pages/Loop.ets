import router from '@ohos.router'

@Entry
@Component
struct Loop {
  @State message: string = '分支'
  @State age:number = 15

  titleArr:Array<string> = ['马老师',"帝心",`鸿蒙之父`]


  build() {
    Column({space:30}) {
      Text(`我的年龄是${this.age}岁了`).fontSize(30)
      // 分支
      if (this.age > 18){
        Text('小红').fontSize(30)
      }else{
        Text('小绿').fontSize(30)
      }
      Divider()
      Button('age++')
        .onClick(() => {
          this.age++
        })

      Divider()
     ForEach(this.titleArr, (item:string,index:number) => {
       Text(item + index)
     })
      Divider()
      // 建议使用两种。数值处理/字符串处理
      // if (是7的倍数或者个位数是7或者十位数是7){
      //   Text('过儿')
      // }else{
      //   Text(`作业：逢七过：当前应该显式的是${this.age}` )
      // }

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffe8eeee')
  }
}