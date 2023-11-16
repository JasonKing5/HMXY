/*
 *
 * 全局的变量：使用let关键字声明。  组件内直接使用
 * 组件内的变量：不要使用let 关键字   使用this.调用。
 * */


//  ts:typeScript     ets: extendTs
// 声明变量:命名要求。数字不能开头 可以使用下划线。。。不能使用关键字
let age: number
// 声明并赋值
let new_age: number = 28
// 数值类型
let num1: number = 18 //十进制
let num2: number = 0b10011 //ob 二进制
let num3: number = 0o1234567 // 0o 八进制
let num4: number = 0x123abcdef //0x 十六进制
// 字符串类型
let str1: string = 'HarmonyOS4.0'
let str2: string = "ArkTS"
let str3: string = `帝心今年${num1}岁了`   //tab上方飘号键盘
// 布尔类型 true false
let stateOn: boolean = true
let stateOff: boolean = false
// 数组
let course1: Array<string> = ['入门',"语法",`组件`]
let course2: string[] = ['入门',"语法",`组件`]
// 元组 帝心 28  120  --->user
let user: [string,number,number] = ['帝心',28,120]
// 任意类型
let data :any = true
// 枚举类型
enum myColor{
  Red = 'red',
  Green = 'green'
}

@Entry
@Component
struct Index {
   num1: number = 28 //十进制
  build() {
    Row() {
      Column() {
        Text(this.num1 + '')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Divider()
        Text(course1[1])
          .fontSize(50)
          .fontColor(myColor.Red)

      }
      .width('100%')
    }
    .height('100%')
  }
}



