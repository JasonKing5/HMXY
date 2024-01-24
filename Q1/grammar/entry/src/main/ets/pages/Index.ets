// 声明变量并赋值   ：初始化
let pome: string= '劝君莫惜金缕衣 劝君惜取少年时'

// 声明变量，未赋值
let age:number
age = 18

// 变量名要求
let a
let b
let c
let me

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}